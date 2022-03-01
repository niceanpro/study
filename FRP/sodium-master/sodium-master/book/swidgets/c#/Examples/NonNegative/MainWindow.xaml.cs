﻿using System.Windows;
using Sodium;
using SWidgets;

namespace NonNegative
{
    public partial class MainWindow
    {
        public MainWindow()
        {
            this.InitializeComponent();

            Transaction.RunVoid(() =>
            {
                DiscreteCellLoop<int> value = new DiscreteCellLoop<int>();
                SLabel lblValue = new SLabel(value.Map(i => i.ToString()));
                SButton plus = new SButton { Content = "+", Width = 25, Margin = new Thickness(5, 0, 0, 0) };
                SButton minus = new SButton { Content = "-", Width = 25, Margin = new Thickness(5, 0, 0, 0) };

                this.Container.Children.Add(lblValue);
                this.Container.Children.Add(plus);
                this.Container.Children.Add(minus);

                Stream<int> sPlusDelta = plus.SClicked.Map(_ => 1);
                Stream<int> sMinusDelta = minus.SClicked.Map(_ => -1);
                Stream<int> sDelta = sPlusDelta.OrElse(sMinusDelta);
                Stream<int> sUpdate = sDelta.Snapshot(value, (d, v) => v + d).Filter(n => n >= 0);
                value.Loop(sUpdate.Hold(0));
            });
        }
    }
}