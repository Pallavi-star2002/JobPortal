<%@ Page Title="" Language="C#" MasterPageFile="~/JobRecruiter.Master" AutoEventWireup="true" CodeBehind="JobRecruiter_JobPost.aspx.cs" Inherits="Job_Portal.JobRecruiterMod.JobRecruiter_JobPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>JobProfile:</td>
            <td><asp:DropDownList ID="ddljobprofile" runat="server"></asp:DropDownList></td>
        </tr>

        <tr>
    <td>JobMode:</td>
    <td><asp:DropDownList ID="ddljobmode" runat="server">
         <asp:ListItem Text="--Select---" Value="0"></asp:ListItem>
        <asp:ListItem Text="work from office" Value="1"></asp:ListItem>
        <asp:ListItem Text="work from Home" Value="2"></asp:ListItem>
        <asp:ListItem Text="Hybrid" Value="3"></asp:ListItem>
        </asp:DropDownList></td>
</tr>


      <tr>
    <td>Required Gender:</td>
    <td><asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
        <asp:ListItem Text="Female" Value="2"></asp:ListItem>
        <asp:ListItem Text="Both" Value="3"></asp:ListItem>
        </asp:RadioButtonList></td>
</tr>

              <tr>
    <td>Required Qualification:</td>
    <td><asp:CheckBoxList ID="cblqualification" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
</tr>

        <tr>
    <td>MinExp:</td>
    <td><asp:TextBox ID="txtminexp" runat="server"></asp:TextBox></td>
</tr>
        <tr>
    <td>maxExp :</td>
    <td><asp:TextBox ID="txtmaxexp" runat="server"></asp:TextBox></td>
</tr>

                <tr>
    <td>MinSalary :</td>
    <td><asp:TextBox ID="txtminsalary" runat="server"></asp:TextBox></td>
</tr>

                <tr>
    <td>MaxSalary :</td>
    <td><asp:TextBox ID="txtmaxsalary" runat="server"></asp:TextBox></td>
</tr>

                        <tr>
    <td>Vacancy :</td>
    <td><asp:TextBox ID="txtvacancy" runat="server"></asp:TextBox></td>
</tr>

                                <tr>
    <td>Comments:</td>
    <td><asp:TextBox ID="txtcomments" runat="server"></asp:TextBox></td>
</tr>

        <tr>
            <td></td>
            <td><asp:Button ID="btnsubmit" Text="Submit" runat="server" OnClick="btnsubmit_Click"/></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Label ID="lblmsg" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></td>
        </tr>

    </table>

</asp:Content>
