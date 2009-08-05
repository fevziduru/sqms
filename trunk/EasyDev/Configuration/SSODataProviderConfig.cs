namespace EasyDev.Configuration
{
    /// <summary>
    /// 
    /// </summary>
    public class SSODataProviderConfig : ConfigurationBase, ICustomConfiguration
    {
        public SSODataProviderConfig()
        {
            this.NameAttribute = "datasourceName";
            this.ValueAttribute = "providerType";
        }
    }
}
