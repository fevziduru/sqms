<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SelectTemplateField.ascx.cs" Inherits="SQMS.Application.SelectTemplateField" %>

<a style="color:#0000ff;text-decoration:underline" onclick="SelectItem({'value':'<%=hidValue.Value%>','text':'<%=hidText.Value%>'})">选择</a>
<asp:HiddenField ID="hidValue" runat="server" Value='<%#Eval("value")%>' />
<asp:HiddenField ID="hidText" runat="server" Value='<%#Eval("text")%>' />