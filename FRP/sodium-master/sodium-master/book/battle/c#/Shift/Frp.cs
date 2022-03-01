using System;
using System.Windows.Controls;
using Sodium;

namespace Shift
{
    public class Frp : IParadigm
    {
        private readonly IListener listener;

        private readonly StreamSink<MouseEvtWithElement> sMouseDown = new StreamSink<MouseEvtWithElement>();
        private readonly StreamSink<MouseEvt> sMouseMove = new StreamSink<MouseEvt>();
        private readonly StreamSink<MouseEvt> sMouseUp = new StreamSink<MouseEvt>();
        private readonly StreamSink<bool> sShift = new StreamSink<bool>();

        public Frp(Action<string> addMessage)
        {
            this.listener = Transaction.Run(() =>
            {
                DiscreteCell<Maybe<DragInfo>> dragInfo =
                    this.sMouseDown.Map(me => Maybe.Some(new DragInfo(me, Canvas.GetLeft(me.Element.Polygon).ZeroIfNaN(), Canvas.GetTop(me.Element.Polygon).ZeroIfNaN())))
                        .OrElse(this.sMouseUp.Map(_ => Maybe<DragInfo>.None)).Hold(Maybe.None);
                DiscreteCell<bool> axisLock = this.sShift.Hold(false);
                Stream<MouseEvt> mouseMoveWhileDragging = dragInfo.Cell.Map(md => md.Match(d => this.sMouseMove, Stream.Never<MouseEvt>)).SwitchS();
                IListener listener1 = dragInfo.Updates.FilterMaybe().Listen(d => addMessage("FRP dragging " + d.Me.Element.Name));
                IListener listener2 = mouseMoveWhileDragging
                    .Snapshot(dragInfo, axisLock, (me, md, a) => md.Match(d => Maybe.Some(new Reposition(d, me, a)), () => Maybe.None))
                    .FilterMaybe()
                    .Listen(p =>
                    {
                        Canvas.SetLeft(p.Polygon, p.Left);
                        Canvas.SetTop(p.Polygon, p.Top);
                    });
                return new CompositeListener(new[] { listener1, listener2 });
            });
        }

        public void HandleMouseDown(MouseEvtWithElement me) => this.sMouseDown.Send(me);
        public void HandleMouseMove(MouseEvt me) => this.sMouseMove.Send(me);
        public void HandleMouseUp(MouseEvt me) => this.sMouseUp.Send(me);
        public void HandleShift(bool isDown) => this.sShift.Send(isDown);

        public void Dispose()
        {
            this.listener.Unlisten();
        }
    }
}