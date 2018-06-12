using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using WebMauGiao.Common;

namespace WebMauGiao.Filters
{
    public class HasAuthenticationAttribute: AuthorizeAttribute
    {
        public string _role { get; set; }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var _session = (string)HttpContext.Current.Session["Authorization"];       
            if (!IsUserAuthorized(_session))
            {
                return false;
            }
            return true;
        }

        private bool IsUserAuthorized(string _session)
        {
            if (_session != null)
            {
                string _authoToken = _session;
                var _authModule = new AuthenticationModule();
                JwtSecurityToken userPayloadToken = _authModule.GenerateUserClaimFromJWT(_authoToken);
                if (userPayloadToken != null)
                {
                    var identity = _authModule.PopulateUserIdentity(userPayloadToken);
                    var _email = identity._email;
                    List<string> privilegeLevels = this.GetCredentialByLoggedInUser(Convert.ToInt32(_email));
                    if (privilegeLevels.Contains(this._role)) return true;
                }
            }
            return false;
        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {

            var values = new RouteValueDictionary(new
            {
                action = "Error",
                controller = "Home"
            });
            filterContext.Result = new RedirectToRouteResult(values);
        }
        private List<string> GetCredentialByLoggedInUser(long username)
        {
            var credentials = (List<string>)HttpContext.Current.Session[CommonConstants.SESSION_CREDENTIAL];
            return credentials;
        }
    }
}