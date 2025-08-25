using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sdaproject
{
    public class SessionManager
    {
        private static SessionManager _instance;
        private static readonly object _lock = new object();
        public int UserId { get; private set; }
        public string Username { get; set; }
        public string Password { get; private set; }

        private SessionManager() { }

        public static SessionManager Instance
        {
            get
            {
                if (_instance == null)
                {
                    lock (_lock)
                    {
                        if (_instance == null)
                        {
                            _instance = new SessionManager();
                        }
                    }
                }
                return _instance;
            }
        }

        public void StartSession(int userId, string username, string password)
        {
            UserId = userId;
            Username = username;
            Password = password;
        }

        public void EndSession()
        {
            UserId = 0;
            Username = null;
            Password = null;
        }

        public bool IsLoggedIn()
        {
            return !string.IsNullOrEmpty(Username);
        }
        public void UpdateUsername(string newUsername)
        {
            Username = newUsername;
        }
    }
}