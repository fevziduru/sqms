﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:2.0.50727.4062
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace SQMS.Application.ServiceReference1 {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReference1.MobileInterfacesSoap")]
    public interface MobileInterfacesSoap {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/UpdateQualityData", ReplyAction="*")]
        bool UpdateQualityData();
        
        // CODEGEN: 命名空间 http://tempuri.org/ 的元素名称 empId 以后生成的消息协定未标记为 nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/MobileLogin", ReplyAction="*")]
        SQMS.Application.ServiceReference1.MobileLoginResponse MobileLogin(SQMS.Application.ServiceReference1.MobileLoginRequest request);
        
        // CODEGEN: 命名空间 http://tempuri.org/ 的元素名称 equIdentify 以后生成的消息协定未标记为 nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/RegisterEquipment", ReplyAction="*")]
        SQMS.Application.ServiceReference1.RegisterEquipmentResponse RegisterEquipment(SQMS.Application.ServiceReference1.RegisterEquipmentRequest request);
        
        // CODEGEN: 命名空间 http://tempuri.org/ 的元素名称 equIdentity 以后生成的消息协定未标记为 nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/UpdateWorkStatus", ReplyAction="*")]
        SQMS.Application.ServiceReference1.UpdateWorkStatusResponse UpdateWorkStatus(SQMS.Application.ServiceReference1.UpdateWorkStatusRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class MobileLoginRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="MobileLogin", Namespace="http://tempuri.org/", Order=0)]
        public SQMS.Application.ServiceReference1.MobileLoginRequestBody Body;
        
        public MobileLoginRequest() {
        }
        
        public MobileLoginRequest(SQMS.Application.ServiceReference1.MobileLoginRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class MobileLoginRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string empId;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string equId;
        
        public MobileLoginRequestBody() {
        }
        
        public MobileLoginRequestBody(string empId, string equId) {
            this.empId = empId;
            this.equId = equId;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class MobileLoginResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="MobileLoginResponse", Namespace="http://tempuri.org/", Order=0)]
        public SQMS.Application.ServiceReference1.MobileLoginResponseBody Body;
        
        public MobileLoginResponse() {
        }
        
        public MobileLoginResponse(SQMS.Application.ServiceReference1.MobileLoginResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class MobileLoginResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(Order=0)]
        public bool MobileLoginResult;
        
        public MobileLoginResponseBody() {
        }
        
        public MobileLoginResponseBody(bool MobileLoginResult) {
            this.MobileLoginResult = MobileLoginResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class RegisterEquipmentRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="RegisterEquipment", Namespace="http://tempuri.org/", Order=0)]
        public SQMS.Application.ServiceReference1.RegisterEquipmentRequestBody Body;
        
        public RegisterEquipmentRequest() {
        }
        
        public RegisterEquipmentRequest(SQMS.Application.ServiceReference1.RegisterEquipmentRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class RegisterEquipmentRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string equIdentify;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string equname;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=2)]
        public string orgid;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=3)]
        public string suiteid;
        
        public RegisterEquipmentRequestBody() {
        }
        
        public RegisterEquipmentRequestBody(string equIdentify, string equname, string orgid, string suiteid) {
            this.equIdentify = equIdentify;
            this.equname = equname;
            this.orgid = orgid;
            this.suiteid = suiteid;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class RegisterEquipmentResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="RegisterEquipmentResponse", Namespace="http://tempuri.org/", Order=0)]
        public SQMS.Application.ServiceReference1.RegisterEquipmentResponseBody Body;
        
        public RegisterEquipmentResponse() {
        }
        
        public RegisterEquipmentResponse(SQMS.Application.ServiceReference1.RegisterEquipmentResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class RegisterEquipmentResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(Order=0)]
        public bool RegisterEquipmentResult;
        
        public RegisterEquipmentResponseBody() {
        }
        
        public RegisterEquipmentResponseBody(bool RegisterEquipmentResult) {
            this.RegisterEquipmentResult = RegisterEquipmentResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class UpdateWorkStatusRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="UpdateWorkStatus", Namespace="http://tempuri.org/", Order=0)]
        public SQMS.Application.ServiceReference1.UpdateWorkStatusRequestBody Body;
        
        public UpdateWorkStatusRequest() {
        }
        
        public UpdateWorkStatusRequest(SQMS.Application.ServiceReference1.UpdateWorkStatusRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class UpdateWorkStatusRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string equIdentity;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string empid;
        
        [System.Runtime.Serialization.DataMemberAttribute(Order=2)]
        public bool isStartup;
        
        public UpdateWorkStatusRequestBody() {
        }
        
        public UpdateWorkStatusRequestBody(string equIdentity, string empid, bool isStartup) {
            this.equIdentity = equIdentity;
            this.empid = empid;
            this.isStartup = isStartup;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class UpdateWorkStatusResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="UpdateWorkStatusResponse", Namespace="http://tempuri.org/", Order=0)]
        public SQMS.Application.ServiceReference1.UpdateWorkStatusResponseBody Body;
        
        public UpdateWorkStatusResponse() {
        }
        
        public UpdateWorkStatusResponse(SQMS.Application.ServiceReference1.UpdateWorkStatusResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class UpdateWorkStatusResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(Order=0)]
        public bool UpdateWorkStatusResult;
        
        public UpdateWorkStatusResponseBody() {
        }
        
        public UpdateWorkStatusResponseBody(bool UpdateWorkStatusResult) {
            this.UpdateWorkStatusResult = UpdateWorkStatusResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public interface MobileInterfacesSoapChannel : SQMS.Application.ServiceReference1.MobileInterfacesSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public partial class MobileInterfacesSoapClient : System.ServiceModel.ClientBase<SQMS.Application.ServiceReference1.MobileInterfacesSoap>, SQMS.Application.ServiceReference1.MobileInterfacesSoap {
        
        public MobileInterfacesSoapClient() {
        }
        
        public MobileInterfacesSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public MobileInterfacesSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public MobileInterfacesSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public MobileInterfacesSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public bool UpdateQualityData() {
            return base.Channel.UpdateQualityData();
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        SQMS.Application.ServiceReference1.MobileLoginResponse SQMS.Application.ServiceReference1.MobileInterfacesSoap.MobileLogin(SQMS.Application.ServiceReference1.MobileLoginRequest request) {
            return base.Channel.MobileLogin(request);
        }
        
        public bool MobileLogin(string empId, string equId) {
            SQMS.Application.ServiceReference1.MobileLoginRequest inValue = new SQMS.Application.ServiceReference1.MobileLoginRequest();
            inValue.Body = new SQMS.Application.ServiceReference1.MobileLoginRequestBody();
            inValue.Body.empId = empId;
            inValue.Body.equId = equId;
            SQMS.Application.ServiceReference1.MobileLoginResponse retVal = ((SQMS.Application.ServiceReference1.MobileInterfacesSoap)(this)).MobileLogin(inValue);
            return retVal.Body.MobileLoginResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        SQMS.Application.ServiceReference1.RegisterEquipmentResponse SQMS.Application.ServiceReference1.MobileInterfacesSoap.RegisterEquipment(SQMS.Application.ServiceReference1.RegisterEquipmentRequest request) {
            return base.Channel.RegisterEquipment(request);
        }
        
        public bool RegisterEquipment(string equIdentify, string equname, string orgid, string suiteid) {
            SQMS.Application.ServiceReference1.RegisterEquipmentRequest inValue = new SQMS.Application.ServiceReference1.RegisterEquipmentRequest();
            inValue.Body = new SQMS.Application.ServiceReference1.RegisterEquipmentRequestBody();
            inValue.Body.equIdentify = equIdentify;
            inValue.Body.equname = equname;
            inValue.Body.orgid = orgid;
            inValue.Body.suiteid = suiteid;
            SQMS.Application.ServiceReference1.RegisterEquipmentResponse retVal = ((SQMS.Application.ServiceReference1.MobileInterfacesSoap)(this)).RegisterEquipment(inValue);
            return retVal.Body.RegisterEquipmentResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        SQMS.Application.ServiceReference1.UpdateWorkStatusResponse SQMS.Application.ServiceReference1.MobileInterfacesSoap.UpdateWorkStatus(SQMS.Application.ServiceReference1.UpdateWorkStatusRequest request) {
            return base.Channel.UpdateWorkStatus(request);
        }
        
        public bool UpdateWorkStatus(string equIdentity, string empid, bool isStartup) {
            SQMS.Application.ServiceReference1.UpdateWorkStatusRequest inValue = new SQMS.Application.ServiceReference1.UpdateWorkStatusRequest();
            inValue.Body = new SQMS.Application.ServiceReference1.UpdateWorkStatusRequestBody();
            inValue.Body.equIdentity = equIdentity;
            inValue.Body.empid = empid;
            inValue.Body.isStartup = isStartup;
            SQMS.Application.ServiceReference1.UpdateWorkStatusResponse retVal = ((SQMS.Application.ServiceReference1.MobileInterfacesSoap)(this)).UpdateWorkStatus(inValue);
            return retVal.Body.UpdateWorkStatusResult;
        }
    }
}
