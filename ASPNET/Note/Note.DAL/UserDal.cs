using Note.IDAL;
using Note.Model;
using System;
using System.Collections.Generic;

namespace Note.DAL
{
    public class UserDal : IUserDal
    {
        public UserDal()
        {

        }
        public User GetUser(int userNo)
        {
            //return _userIDal.GetUser(userNo);
            throw new NotImplementedException();
        }

        public List<User> GetUserList()
        {
            throw new NotImplementedException();
        }
    }
}
