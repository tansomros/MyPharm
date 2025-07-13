﻿
Imports BigLion
Public Class ReportAssessment
    Inherits System.Web.UI.Page
    Dim ctlM As New MasterController
    Dim dt As New DataTable
    Dim acc As New UserController
    Public dtR As New DataTable
    Dim ctlR As New RequestController
    Dim ctlRpt As New ReportController

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Request.Cookies("CPA")) Then
            Response.Redirect("Default.aspx")
        End If
        If Not IsPostBack Then
            pnData.Visible = False
            LoadRequestType()
            LoadStatus()
            LoadLocation()
            txtStartDate.Text = Today.Date.ToString("dd/MM/yyyy")
            txtEndDate.Text = Today.Date.ToString("dd/MM/yyyy")
            lblReportTitle.Text = "รายงานผลคะแนนประเมินรับรอง"
            'If Request("s") = "A1" Then
            'Else
            '    lblReportTitle.Text = "รายงานคำขอรับรองฯ"
            'End If
        End If

    End Sub
    Private Sub LoadRequestType()
        ddlType.DataSource = ctlR.RequestType_GetForReport
        ddlType.DataTextField = "Name"
        ddlType.DataValueField = "UID"
        ddlType.DataBind()
    End Sub
    Private Sub LoadStatus()
        dt = ctlM.AssessmentStatus_GetForReport()
        If dt.Rows.Count > 0 Then
            With ddlStatus
                .DataSource = dt
                .DataTextField = "Descriptions"
                .DataValueField = "Code"
                .DataBind()
            End With
        End If
    End Sub

    Private Sub LoadLocation()
        Dim ctlL As New LocationController
        ddlLocation.DataSource = ctlL.Location_GetForReport
        ddlLocation.DataTextField = "LocationName"
        ddlLocation.DataValueField = "LocationUID"
        ddlLocation.DataBind()
    End Sub


    Protected Sub cmdView_Click(sender As Object, e As EventArgs) Handles cmdView.Click
        If txtStartDate.Text = "" Or txtEndDate.Text = "" Then
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModals(this,'ผลการตรวจสอบ','กรุณาระบุช่วงวันที่ก่อน');", True)
            Exit Sub
        End If

        Dim Bdate, Edate As String
        Bdate = ConvertStrDate2DBDate(txtStartDate.Text)
        Edate = ConvertStrDate2DBDate(txtEndDate.Text)
        If Request("s") = "A1" Then
            dtR = ctlRpt.RPT_Assessment_GetScore(Bdate, Edate, ddlType.SelectedValue, ddlStatus.SelectedValue, ddlLocation.SelectedValue)
        Else
            dtR = ctlRpt.RPT_Assessment_GetSWOT(Bdate, Edate, ddlType.SelectedValue, ddlStatus.SelectedValue, ddlLocation.SelectedValue)
        End If

        pnData.Visible = True
    End Sub

    Protected Sub cmdExport_Click(sender As Object, e As EventArgs) Handles cmdExport.Click
        If txtStartDate.Text = "" Or txtEndDate.Text = "" Then
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModals(this,'ผลการตรวจสอบ','กรุณาระบุช่วงวันที่ก่อน');", True)
            Exit Sub
        End If
        Dim Bdate, Edate As String
        Bdate = ConvertStrDate2DBDate(txtStartDate.Text)
        Edate = ConvertStrDate2DBDate(txtEndDate.Text)
        pnData.Visible = False
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Report", "window.open('Report/ReportViewer?R=" & Request("s") & "&ST=" & ddlStatus.SelectedValue & "&LID=" & ddlLocation.SelectedValue & "&TYPE=" & ddlType.SelectedValue & "&BDT=" & Bdate & "&EDT=" & Edate & "&RPTTYPE=EXCEL','_blank');", True)
    End Sub
End Class

