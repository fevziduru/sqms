<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoadEdit.aspx.cs" Inherits="SQMS.Application.Views.Road.RoadEdit"
    MasterPageFile="~/Masters/Main.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width: 100%">
            <tr>
                <td align="right">
                    <a href="RoadList.aspx?p=RoadRoadList">返回到列表</a>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <fieldset>
                        <asp:Button Width="110px" runat="server" ID="BtnSave" Text="保存" 
                            onclick="BtnSave_Click" />
                        <asp:Button Width="110px" runat="server" ID="BtnSaveAndNew" Text="保存并新增" 
                            onclick="BtnSaveAndNew_Click" />
                    </fieldset>
                </td>
            </tr>
        </table>
        <br />
        <fieldset>
            <legend>路段基本信息</legend>
            <table style="width: 100%">
                <tr>
                    <td style="width: 110px">
                        路段名称：
                    </td>
                    <td style="width: 330px">
                        <asp:TextBox ID="TextBoxRoadName" runat="server"></asp:TextBox><span style="color: Red">*</span>
                        <asp:RequiredFieldValidator ID="RFVRoadName" runat="server" ControlToValidate="TextBoxRoadName"
                            SetFocusOnError="true" ErrorMessage="路段名称必填" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 110px">
                        路段编码：
                    </td>
                    <td style="width: 330px">
                        <asp:TextBox ID="TextBoxRoadCode" runat="server"></asp:TextBox><span style="color: Red">*</span>
                        <asp:RequiredFieldValidator ID="RFVRoadCode" runat="server" ControlToValidate="TextBoxRoadCode"
                            SetFocusOnError="true" ErrorMessage="路段编码必填" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        路段类型
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListRoadType" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                    作业时间
                    </td>
                    <td>
                    <asp:TextBox ID="TextBoxWorkTime" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        作业开始时间</td>
                    <td>
                    <asp:TextBox ID="TextBoxWorkBeginTime" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        作业结束时间</td>
                    <td>
                    <asp:TextBox ID="TextBoxWorkEndTime" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        工作人数</td>
                    <td>
                    <asp:TextBox ID="TextBoxWorkerNum" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        人均工作量</td>
                    <td>
                    <asp:TextBox ID="TextBoxAvgWorkAmount" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:CheckBox ID="CheckBoxIsVoid" runat="server" Text="禁用" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        备注：
                    </td>
                    <td colspan="3">
                        <asp:TextBox TextMode="MultiLine" ID="TextBoxMemo" runat="server" 
                            Height="181px" Width="488px"></asp:TextBox>
                    </td>
                    
                </tr>
            </table>
        </fieldset>
        
    </div>
</asp:Content>
