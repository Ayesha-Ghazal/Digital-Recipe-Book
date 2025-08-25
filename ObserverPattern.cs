using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

using System.Linq;
using System.Web;

namespace sdaproject
{
    public interface IObserver
    {
        void Update(string message);
    }

    public interface ISubject
    {
        void Attach(IObserver observer);
        void Detach(IObserver observer);
        void Notify(string message);
    }
    public class UserProfileSubject : ISubject
    {
        private List<IObserver> observers = new List<IObserver>();

        public void Attach(IObserver observer)
        {
            observers.Add(observer);
        }

        public void Detach(IObserver observer)
        {
            observers.Remove(observer);
        }

        public void Notify(string message)
        {
            foreach (var observer in observers)
            {
                observer.Update(message);
            }
        }
    }
    

    public class EmailNotifierObserver : IObserver
    {
        private Label _label;

        public EmailNotifierObserver(Label label)
        {
            _label = label;
        }

        public void Update(string message)
        {
            _label.Text += "EMAIL: " + message + "<br/>";
        }
    }

}