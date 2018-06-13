using System.Security.Principal;

namespace WebMauGiao.Filters
{
    public class JWTAuthenticationIdentity:GenericIdentity
    {
        public string _email { get; set; }
        public string _username { get; set; }
        public JWTAuthenticationIdentity(string email):base(email)
        {
            _email = email;
        }
    }
}