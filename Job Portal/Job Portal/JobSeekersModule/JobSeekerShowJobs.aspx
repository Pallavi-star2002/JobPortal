<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker.Master" AutoEventWireup="true" CodeBehind="JobSeekerShowJobs.aspx.cs" Inherits="Job_Portal.JobSeekersModule.JobSeekerShowJobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <table>

       <tr>
           <td>
               <asp:DropDownList ID="ddljobprofile" runat="server"></asp:DropDownList>
               <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
           </td>
       </tr>



    <tr>
        <td>
        <asp:GridView ID="gvjobshow" runat="server"  AutoGenerateColumns="False" OnRowCommand="gvjobshow_RowCommand" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">

            <AlternatingRowStyle BackColor="#DCDCDC" />

            <Columns>
                <asp:TemplateField HeaderText="Recruiter Name">
                    <ItemTemplate>
                        <%#Eval("JobRecruiterName") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Job Profile">
    <ItemTemplate>
        <%#Eval("JobProfileName") %>
    </ItemTemplate>
</asp:TemplateField>
                <asp:TemplateField HeaderText="Work Mode">
    <ItemTemplate>
        <%#Eval("JobPostMode").ToString()=="1" ? "Work From Office" :Eval("JobpostMode").ToString()=="2" ? "work From Home": "Hybrid"%>
    </ItemTemplate>
</asp:TemplateField>

  <asp:TemplateField HeaderText="Gender">
    <ItemTemplate>
        <%#Eval("JobPostGender").ToString()=="1" ? "Male" :Eval("JobPostGender").ToString()=="2" ? "Female": "both"%>
    </ItemTemplate>
</asp:TemplateField>
                <asp:TemplateField HeaderText="Recruiter Qualification">
    <ItemTemplate>
        <%#Eval("JobPostQualifications") %>
    </ItemTemplate>
</asp:TemplateField>

 <asp:TemplateField HeaderText="Recruiter Experince">
    <ItemTemplate>
        <%#Eval("JobPostMinExp") %> year -<%#Eval("JobPostMaxExp") %>year
    </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="offer salary">
    <ItemTemplate>
     Rs.   <%#Eval("JobPostMinSalary") %> - Rs.<%#Eval("JobPostMaxSalary") %> 
    </ItemTemplate>
</asp:TemplateField>


      <asp:TemplateField HeaderText="Vacancy">
    <ItemTemplate>
        <%#Eval("JobPostVacancy") %>
    </ItemTemplate>
</asp:TemplateField>

         <asp:TemplateField HeaderText="comment">
    <ItemTemplate>
        <%#Eval("JobPostComments") %>
    </ItemTemplate>
</asp:TemplateField>

  
<asp:TemplateField HeaderText="Apply">
    <ItemTemplate>
        <asp:Button ID="btnApply" runat="server" Text="Apply" CommandName="ApplyJob"
            CommandArgument='<%# Eval("JobPostId") %>' CssClass="btn btn-primary" />
        <asp:Label ID="lblApplied" runat="server" Text="Applied" ForeColor="Green" Visible="false" />
    </ItemTemplate>
</asp:TemplateField>



            </Columns>


            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />


        </asp:GridView>
        </td>
    </tr>
</table>






</asp:Content>
