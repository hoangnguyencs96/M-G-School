using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Web;

namespace WebMauGiao.Filters
{
    public class AuthenticationModule
    {
        private const string communicationKey = "qwsdfghjksdfgyuiodfghjkdfghjxcvzsertgbnjik";
        SecurityKey _securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(communicationKey));

        // tao token 
        public string GenerateTokenForUser(string _email, string _username)
        {
            SecurityKey _securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(communicationKey));
            var _now = DateTime.UtcNow;
            var _credentials = new SigningCredentials(_securityKey, SecurityAlgorithms.HmacSha256Signature, SecurityAlgorithms.Sha256Digest);
            var _claimIdentity = new ClaimsIdentity(new List<Claim>()
            {
                new Claim(ClaimTypes.Name,_username),
                new Claim(ClaimTypes.NameIdentifier,_email),
               
            });
            var _securityTokenDescriptor = new SecurityTokenDescriptor()
            {
                Audience="www.abc.com",
                Issuer="pdh",
                Subject = _claimIdentity,
                Expires = _now.AddYears(Convert.ToInt32(1)),
                SigningCredentials = _credentials,
                
            };
            var _tokenHandler = new JwtSecurityTokenHandler();
            var _plainToken = _tokenHandler.CreateToken(_securityTokenDescriptor);
            var _signedAndEncodedToken = _tokenHandler.WriteToken(_plainToken);
            return _signedAndEncodedToken;
        }

        public JwtSecurityToken GenerateUserClaimFromJWT(string _authToken)
        {
            var _tokenValidationParameters = new TokenValidationParameters()
            {
                ValidAudience="www.abc.com",
                ValidIssuer="pdh",
                ValidateLifetime=true,
                ValidateIssuerSigningKey=true,
                IssuerSigningKey = _securityKey,
                
            };
            var _tokenHandler = new JwtSecurityTokenHandler();
            SecurityToken _validatedToken;
            try
            {
                _tokenHandler.ValidateToken(_authToken, _tokenValidationParameters, out _validatedToken);
            }
            catch (Exception)
            {
                return null;
            }
            return _validatedToken as JwtSecurityToken;
        }

        public JWTAuthenticationIdentity PopulateUserIdentity(JwtSecurityToken userPayloadToken)
        {
            string _name = ((userPayloadToken)).Claims.FirstOrDefault(m => m.Type == "unique_name").Value;
            string _email = ((userPayloadToken)).Claims.FirstOrDefault(m => m.Type == "nameid").Value;
            return new JWTAuthenticationIdentity(_name) { _username = _name, _email = _email };

        }
    }
}