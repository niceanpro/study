using Note.DAL;
using Note.IDAL;
using Note.Model;
using System;
using System.Collections.Generic;

namespace Note.BLL
{
    public class UserBLL 
    {

        //private UserDal _userDal = new UserDal();
        private readonly IUserDal _userIDal;

        public UserBLL(IUserDal userIDal)
        {
            _userIDal = userIDal;
        }
        public User GetUser(int userNo)
        {
            return _userIDal.GetUser(userNo);
        }

        public List<User> GetUserList()
        {
            throw new NotImplementedException();
        }
    }
}
