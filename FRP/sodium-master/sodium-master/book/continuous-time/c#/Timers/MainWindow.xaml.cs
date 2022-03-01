﻿using System;
using System.Threading.Tasks;
using System.Windows.Controls;
using Sodium;
using Sodium.Time;

namespace Timers
{
    public partial class MainWindow
    {
        public MainWindow()
        {
            this.InitializeComponent();

            this.Loaded += async (sender, args) =>
            {
                ITimerSystem<DateTime> sys = new SystemClockTimerSystem(e => this.Dispatcher.Invoke(() => { throw e; }));
                Cell<DateTime> time = sys.Time;
                StreamSink<Unit> sMain = new StreamSink<Unit>();
                IListener l = Transaction.Run(() =>
                {
                    DateTime t0 = time.Sample();
                    IListener l1 = Periodic(sys, TimeSpan.FromSeconds(1)).Listen(t => this.AddMessage(t - t0 + " timer"));
                    IListener l2 = sMain.Snapshot(time).Listen(t => this.AddMessage(t - t0 + " main"));
                    return new CompositeListener(new[] { l1, l2 });
                });
                for (int i = 0; i < 5; i++)
                {
                    sMain.Send(Unit.Value);
                    await Task.Delay(990);
                }
                l.Unlisten();
            };
        }

        private static Stream<DateTime> Periodic(ITimerSystem<DateTime> sys, TimeSpan period)
        {
            Cell<DateTime> time = sys.Time;
            DiscreteCellLoop<Maybe<DateTime>> oAlarm = new DiscreteCellLoop<Maybe<DateTime>>();
            Stream<DateTime> sAlarm = sys.At(oAlarm);
            oAlarm.Loop(sAlarm.Map(t => Maybe.Some(t + period)).Hold(Maybe.Some(time.Sample() + period)));
            return sAlarm;
        }

        private void AddMessage(string message)
        {
            Action action = () =>
            {
                this.StackPanel.Children.Add(new TextBlock { Text = message });
                this.ScrollViewer.ScrollToBottom();
            };

            if (this.Dispatcher.CheckAccess())
            {
                action();
            }
            else
            {
                this.Dispatcher.Invoke(action);
            }
        }
    }
}