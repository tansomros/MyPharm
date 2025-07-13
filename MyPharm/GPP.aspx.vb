﻿Imports System
Imports System.IO
Imports System.Web.UI
Imports BigLion
Public Class GPP
    Inherits System.Web.UI.Page
    Dim ctlU As New UserController
    Dim ctlL As New LocationController
    Dim dt As New DataTable
    Dim ctlPs As New PharmacistController
    Dim ctlM As New MediaController
    Dim ctlA As New AssessmentController
    Private UploadDirectory As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Request.Cookies("CPA")) Then
            Response.Redirect("Default.aspx")
        End If
        If Not IsPostBack Then
            hdLocationUID.Value = Request.Cookies("LoginLocationUID").Value
            If Not Request("id") = Nothing Then
                LoadAssessment(Request("id"))
                If hdLocationUID.Value = Nothing Or hdLocationUID.Value = "" Then
                    LoadRequestDetail(Request("id"))
                End If

                UploadDirectory = Server.MapPath("~/imageUploads/" & hdLocationUID.Value & "/GPP/")

                If Not Directory.Exists(UploadDirectory) Then
                    Directory.CreateDirectory(UploadDirectory)
                End If

                CheckStatusAssessment()

            End If

            If Request.Cookies("ROLE_ID").Value = 1 Then
                txtFinalScore.Enabled = False
                ddlFinalResult.Enabled = False
                txtRemark.Enabled = False
            End If
        End If
    End Sub
    Private Sub LoadRequestDetail(RequestUID As Integer)
        Dim ctlR As New RequestController
        dt = ctlR.Request_GetByUID(RequestUID)
        If dt.Rows.Count > 0 Then
            hdRequestUID.Value = dt.Rows(0)("UID")
            hdLocationUID.Value = dt.Rows(0)("LocationUID")
        End If
        dt = Nothing
    End Sub
    Private Sub LoadAssessment(RequestUID As Integer)
        dt = ctlA.Assessment_GetByRequestUID(RequestUID)
        If dt.Rows.Count > 0 Then
            hdGPPUID.Value = String.Concat(dt.Rows(0)("GPP_ASMUID"))
            hdLocationUID.Value = String.Concat(dt.Rows(0)("LocationUID"))
            hdRequestUID.Value = String.Concat(dt.Rows(0)("RequestUID"))

            txtFinalScore.Text = String.Concat(dt.Rows(0)("GPP_Score"))
            lblFinalPercent.Text = String.Concat(dt.Rows(0)("GPP_Percentage"))
            txtRemark.Text = String.Concat(dt.Rows(0)("GPP_Remark"))

            LoadGPP_Score()
        End If
    End Sub
    Private Sub CheckStatusAssessment()
        Dim iStatus As Integer = 0
        Dim ctlA As New AssessmentController
        dt = ctlA.Assessment_GetStatus(StrNull2Long(Request("id")))
        If dt.Rows.Count > 0 Then
            iStatus = DBNull2Zero(dt.Rows(0)("StatusID"))

            If iStatus >= 1 And iStatus <= 4 Then ' Processing

            ElseIf iStatus >= 5 And iStatus <= 7 Then 'Passed
                If Convert.ToInt32(Request.Cookies("ROLE_ID").Value) = 1 Then
                    cmdSave.Visible = False
                    FileUpload1.Enabled = False
                    cmdUpImg.Visible = False
                    grdImg.Columns(3).Visible = False
                    Label2.Visible = True
                    Label2.Text = "สถานะปัจจุบันไม่สามารถออัพโหลดหรือแก้ไขรูปภาพได้อีก"
                End If
            ElseIf iStatus = 8 Then 'ยกเลิก

            End If
        End If

    End Sub

    Private Sub LoadGPP_Score()
        dt = ctlA.GPP_AssessmentScore_Get(StrNull2Long(hdGPPUID.Value))
        If dt.Rows.Count > 0 Then
            For i = 0 To dt.Rows.Count - 1
                Select Case DBNull2Zero(dt.Rows(i)("ItemUID"))
                    Case 1
                        optS1Q1.SelectedValue = dt.Rows(i)("Score")
                    Case 2
                        optS1Q2.SelectedValue = dt.Rows(i)("Score")
                    Case 3
                        optS1Q3.SelectedValue = dt.Rows(i)("Score")
                    Case 4
                        optS1Q4.SelectedValue = dt.Rows(i)("Score")
                    Case 5
                        optS1Q5.SelectedValue = dt.Rows(i)("Score")
                    Case 6
                        optS1Q6.SelectedValue = dt.Rows(i)("Score")
                    Case 7
                        optS1Q7.SelectedValue = dt.Rows(i)("Score")
                    Case 8
                        optS1Q8.SelectedValue = dt.Rows(i)("Score")
                    Case 9
                        optS1Q9.SelectedValue = dt.Rows(i)("Score")
                    Case 10
                        If DBNull2Zero(dt.Rows(i)("Score")) = -2 Then 'ไม่ตอบอะไรเลย
                            chkS2Q1.Checked = False
                            optS2Q1.ClearSelection()
                        ElseIf DBNull2Zero(dt.Rows(i)("Score")) = -1 Then 'ตอบว่าไม่มี
                            chkS2Q1.Checked = True
                            optS2Q1.ClearSelection()
                        Else 'มีคะแนน
                            chkS2Q1.Checked = False
                            optS2Q1.SelectedValue = dt.Rows(i)("Score")
                        End If
                    Case 11
                        optS2Q2.SelectedValue = dt.Rows(i)("Score")
                    Case 12
                        optS2Q3.SelectedValue = dt.Rows(i)("Score")
                    Case 13
                        optS2Q4.SelectedValue = dt.Rows(i)("Score")
                    Case 14
                        optS2Q5.SelectedValue = dt.Rows(i)("Score")
                    Case 15
                        optS2Q6.SelectedValue = dt.Rows(i)("Score")
                    Case 16
                        optS3Q1.SelectedValue = dt.Rows(i)("Score")
                    Case 17
                        If DBNull2Zero(dt.Rows(i)("Score")) = -2 Then 'ไม่ตอบอะไรเลย
                            chkS3Q2.Checked = False
                            optS3Q2.ClearSelection()
                        ElseIf DBNull2Zero(dt.Rows(i)("Score")) = -1 Then 'ตอบว่าไม่มี
                            chkS3Q2.Checked = True
                            optS3Q2.ClearSelection()
                        Else 'มีคะแนน
                            chkS3Q2.Checked = False
                            optS3Q2.SelectedValue = dt.Rows(i)("Score")
                        End If
                    Case 18
                        optS3Q3.SelectedValue = dt.Rows(i)("Score")
                    Case 19
                        If DBNull2Zero(dt.Rows(i)("Score")) = -2 Then 'ไม่ตอบอะไรเลย
                            chkS3Q4.Checked = False
                            optS3Q4.ClearSelection()
                        ElseIf DBNull2Zero(dt.Rows(i)("Score")) = -1 Then 'ตอบว่าไม่มี
                            chkS3Q4.Checked = True
                            optS3Q4.ClearSelection()
                        Else 'มีคะแนน
                            chkS3Q4.Checked = False
                            optS3Q4.SelectedValue = dt.Rows(i)("Score")
                        End If
                    Case 20
                        If DBNull2Zero(dt.Rows(i)("Score")) = -2 Then 'ไม่ตอบอะไรเลย
                            chkS3Q5.Checked = False
                            optS3Q5.ClearSelection()
                        ElseIf DBNull2Zero(dt.Rows(i)("Score")) = -1 Then 'ตอบว่าไม่มี
                            chkS3Q5.Checked = True
                            optS3Q5.ClearSelection()
                        Else 'มีคะแนน
                            chkS3Q5.Checked = False
                            optS3Q5.SelectedValue = dt.Rows(i)("Score")
                        End If
                    Case 21
                        optS4Q1.SelectedValue = dt.Rows(i)("Score")
                    Case 22
                        optS4Q2.SelectedValue = dt.Rows(i)("Score")
                    Case 23
                        optS4Q3.SelectedValue = dt.Rows(i)("Score")
                    Case 24
                        optS4Q4.SelectedValue = dt.Rows(i)("Score")
                    Case 25
                        optS4Q5.SelectedValue = dt.Rows(i)("Score")
                    Case 26
                        optS4Q6.SelectedValue = dt.Rows(i)("Score")
                    Case 27
                        optS4Q7.SelectedValue = dt.Rows(i)("Score")
                    Case 28
                        optS5Q1.SelectedValue = dt.Rows(i)("Score")
                    Case 29
                        optS5Q2.SelectedValue = dt.Rows(i)("Score")
                    Case 30
                        optS5Q3.SelectedValue = dt.Rows(i)("Score")
                    Case 31
                        optS5Q4.SelectedValue = dt.Rows(i)("Score")
                    Case 32
                        optS5Q5.SelectedValue = dt.Rows(i)("Score")
                    Case 33
                        optS5Q6.SelectedValue = dt.Rows(i)("Score")
                    Case 34
                        optS5Q7.SelectedValue = dt.Rows(i)("Score")
                    Case 35
                        optS5Q8.SelectedValue = dt.Rows(i)("Score")
                    Case 36
                        optS5Q9.SelectedValue = dt.Rows(i)("Score")
                    Case 37
                        optS5Q10.SelectedValue = dt.Rows(i)("Score")
                    Case 38
                        optS5Q11.SelectedValue = dt.Rows(i)("Score")
                    Case 39
                        optS5Q12.SelectedValue = dt.Rows(i)("Score")
                End Select


            Next

            CalculateScore()

        End If

    End Sub
    Private Sub CalculateScore()


        lblScoreS1Q1.Text = (StrNull2GPPScore(optS1Q1.SelectedValue) * 2).ToString()
        lblScoreS1Q2.Text = (StrNull2GPPScore(optS1Q2.SelectedValue) * 1).ToString()
        lblScoreS1Q3.Text = (StrNull2GPPScore(optS1Q3.SelectedValue) * 1).ToString()
        lblScoreS1Q4.Text = (StrNull2GPPScore(optS1Q4.SelectedValue) * 1).ToString()
        lblScoreS1Q5.Text = (StrNull2GPPScore(optS1Q5.SelectedValue) * 1).ToString()
        lblScoreS1Q6.Text = (StrNull2GPPScore(optS1Q6.SelectedValue) * 1).ToString()
        lblScoreS1Q7.Text = (StrNull2GPPScore(optS1Q7.SelectedValue) * 2).ToString()
        lblScoreS1Q8.Text = (StrNull2GPPScore(optS1Q8.SelectedValue) * 2).ToString()
        lblScoreS1Q9.Text = (StrNull2GPPScore(optS1Q9.SelectedValue) * 2).ToString()

        lblSumScoreS1.Text = StrNull2GPPScore(lblScoreS1Q1.Text) + StrNull2GPPScore(lblScoreS1Q2.Text) + StrNull2GPPScore(lblScoreS1Q3.Text) + StrNull2GPPScore(lblScoreS1Q4.Text) + StrNull2GPPScore(lblScoreS1Q5.Text) + StrNull2GPPScore(lblScoreS1Q6.Text) + StrNull2GPPScore(lblScoreS1Q7.Text) + StrNull2GPPScore(lblScoreS1Q8.Text) + StrNull2GPPScore(lblScoreS1Q9.Text)

        lblScoreS2Q1.Text = (StrNull2GPPScore(optS2Q1.SelectedValue) * 2).ToString()
        lblScoreS2Q2.Text = (StrNull2GPPScore(optS2Q2.SelectedValue) * 2).ToString()
        lblScoreS2Q3.Text = (StrNull2GPPScore(optS2Q3.SelectedValue) * 1).ToString()
        lblScoreS2Q4.Text = (StrNull2GPPScore(optS2Q4.SelectedValue) * 1).ToString()
        lblScoreS2Q5.Text = (StrNull2GPPScore(optS2Q5.SelectedValue) * 1).ToString()
        lblScoreS2Q6.Text = (StrNull2GPPScore(optS2Q6.SelectedValue) * 1).ToString()

        lblSumScoreS2.Text = StrNull2GPPScore(lblScoreS2Q1.Text) + StrNull2GPPScore(lblScoreS2Q2.Text) + StrNull2GPPScore(lblScoreS2Q3.Text) + StrNull2GPPScore(lblScoreS2Q4.Text) + StrNull2GPPScore(lblScoreS2Q5.Text) + StrNull2GPPScore(lblScoreS2Q6.Text)


        lblScoreS3Q1.Text = (StrNull2GPPScore(optS3Q1.SelectedValue) * 2).ToString()
        lblScoreS3Q2.Text = (StrNull2GPPScore(optS3Q2.SelectedValue) * 1).ToString()
        lblScoreS3Q3.Text = (StrNull2GPPScore(optS3Q3.SelectedValue) * 1).ToString()
        lblScoreS3Q4.Text = (StrNull2GPPScore(optS3Q4.SelectedValue) * 1).ToString()
        lblScoreS3Q5.Text = (StrNull2GPPScore(optS3Q5.SelectedValue) * 1).ToString()

        lblSumScoreS3.Text = StrNull2GPPScore(lblScoreS3Q1.Text) + StrNull2GPPScore(lblScoreS3Q2.Text) + StrNull2GPPScore(lblScoreS3Q3.Text) + StrNull2GPPScore(lblScoreS3Q4.Text) + StrNull2GPPScore(lblScoreS3Q5.Text)

        lblScoreS4Q1.Text = (StrNull2GPPScore(optS4Q1.SelectedValue) * 2).ToString()
        lblScoreS4Q2.Text = (StrNull2GPPScore(optS4Q2.SelectedValue) * 2).ToString()
        lblScoreS4Q3.Text = (StrNull2GPPScore(optS4Q3.SelectedValue) * 2).ToString()
        lblScoreS4Q4.Text = (StrNull2GPPScore(optS4Q4.SelectedValue) * 1).ToString()
        lblScoreS4Q5.Text = (StrNull2GPPScore(optS4Q5.SelectedValue) * 1).ToString()
        lblScoreS4Q6.Text = (StrNull2GPPScore(optS4Q6.SelectedValue) * 1).ToString()
        lblScoreS4Q7.Text = (StrNull2GPPScore(optS4Q7.SelectedValue) * 2).ToString()

        lblSumScoreS4.Text = StrNull2GPPScore(lblScoreS4Q1.Text) + StrNull2GPPScore(lblScoreS4Q2.Text) + StrNull2GPPScore(lblScoreS4Q3.Text) + StrNull2GPPScore(lblScoreS4Q4.Text) + StrNull2GPPScore(lblScoreS4Q5.Text) + StrNull2GPPScore(lblScoreS4Q6.Text) + StrNull2GPPScore(lblScoreS4Q7.Text)

        lblScoreS5Q1.Text = (StrNull2GPPScore(optS5Q1.SelectedValue) * 2).ToString()
        lblScoreS5Q2.Text = (StrNull2GPPScore(optS5Q2.SelectedValue) * 2).ToString()
        lblScoreS5Q3.Text = (StrNull2GPPScore(optS5Q3.SelectedValue) * 2).ToString()
        lblScoreS5Q4.Text = (StrNull2GPPScore(optS5Q4.SelectedValue) * 2).ToString()
        lblScoreS5Q5.Text = (StrNull2GPPScore(optS5Q5.SelectedValue) * 2).ToString()
        lblScoreS5Q6.Text = (StrNull2GPPScore(optS5Q6.SelectedValue) * 2).ToString()
        lblScoreS5Q7.Text = (StrNull2GPPScore(optS5Q7.SelectedValue) * 2).ToString()
        lblScoreS5Q8.Text = (StrNull2GPPScore(optS5Q8.SelectedValue) * 1).ToString()
        lblScoreS5Q9.Text = (StrNull2GPPScore(optS5Q9.SelectedValue) * 1).ToString()
        lblScoreS5Q10.Text = (StrNull2GPPScore(optS5Q10.SelectedValue) * 1).ToString()
        lblScoreS5Q11.Text = (StrNull2GPPScore(optS5Q11.SelectedValue) * 1).ToString()
        lblScoreS5Q12.Text = (StrNull2GPPScore(optS5Q12.SelectedValue) * 1).ToString()

        lblSumScoreS5.Text = StrNull2GPPScore(lblScoreS5Q1.Text) + StrNull2GPPScore(lblScoreS5Q2.Text) + StrNull2GPPScore(lblScoreS5Q3.Text) + StrNull2GPPScore(lblScoreS5Q4.Text) + StrNull2GPPScore(lblScoreS5Q5.Text) + StrNull2GPPScore(lblScoreS5Q6.Text) + StrNull2GPPScore(lblScoreS5Q7.Text) + StrNull2GPPScore(lblScoreS5Q8.Text) + StrNull2GPPScore(lblScoreS5Q9.Text) + StrNull2GPPScore(lblScoreS5Q10.Text) + StrNull2GPPScore(lblScoreS5Q11.Text) + StrNull2GPPScore(lblScoreS5Q12.Text)

        Dim iTotalScore As Integer = 114

        If chkS2Q1.Checked = True Or (chkS2Q1.Checked = False And optS2Q1.SelectedValue = "") Then
            lblScoreS2Q1.Text = "0"
            iTotalScore = iTotalScore - 4
        End If

        If chkS3Q2.Checked = True Or (chkS3Q2.Checked = False And optS3Q2.SelectedValue = "") Then
            lblScoreS3Q2.Text = "0"
            iTotalScore = iTotalScore - 2
        End If

        If chkS3Q4.Checked = True Or (chkS3Q4.Checked = False And optS3Q4.SelectedValue = "") Then
            lblScoreS3Q4.Text = "0"
            iTotalScore = iTotalScore - 2
        End If

        If chkS3Q5.Checked = True Or (chkS3Q5.Checked = False And optS3Q5.SelectedValue = "") Then
            lblScoreS3Q5.Text = "0"
            iTotalScore = iTotalScore - 2
        End If

        'If optS3Q2.SelectedValue = "-1" Then
        '    iTotalScore = iTotalScore - 2
        'End If
        'If optS3Q4.SelectedValue = "-1" Then
        '    iTotalScore = iTotalScore - 2
        'End If
        'If optS3Q5.SelectedValue = "-1" Then
        '    iTotalScore = iTotalScore - 2
        'End If

        lblTotalScore.Text = iTotalScore.ToString()

        lblNetScore.Text = StrNull2GPPScore(lblSumScoreS1.Text) + StrNull2GPPScore(lblSumScoreS2.Text) + StrNull2GPPScore(lblSumScoreS3.Text) + StrNull2GPPScore(lblSumScoreS4.Text) + StrNull2GPPScore(lblSumScoreS5.Text)

        lblPercentage.Text = ((StrNull2Double(lblNetScore.Text) * 100) / iTotalScore).ToString("##.##")

        If Convert.ToInt32(Request.Cookies("ROLE_ID").Value) = 1 Then
            txtFinalScore.Text = lblNetScore.Text
            lblFinalPercent.Text = lblPercentage.Text
        Else
            lblFinalPercent.Text = ((StrNull2Double(txtFinalScore.Text) * 100) / iTotalScore).ToString("##.##")
        End If


        If StrNull2Zero(lblScoreS1Q1.Text) <= 0 Or StrNull2Zero(lblScoreS1Q4.Text) <= 0 Or StrNull2Zero(lblScoreS1Q5.Text) <= 0 Or StrNull2Zero(lblScoreS1Q7.Text) <= 0 Or StrNull2Zero(lblScoreS1Q9.Text) <= 0 Or StrNull2Zero(lblScoreS2Q2.Text) <= 0 Or StrNull2Zero(lblScoreS2Q3.Text) <= 0 Or StrNull2Zero(lblScoreS2Q4.Text) <= 0 Or StrNull2Zero(lblScoreS2Q5.Text) <= 0 Or StrNull2Zero(lblScoreS2Q6.Text) <= 0 Or StrNull2Zero(lblScoreS4Q1.Text) <= 0 Or StrNull2Zero(lblScoreS4Q3.Text) <= 0 Or StrNull2Zero(lblScoreS5Q1.Text) <= 0 Then
            lblResult.Text = "ไม่ผ่าน"
            lblResult.ForeColor = System.Drawing.Color.Red
            ddlFinalResult.SelectedValue = "N"
            ddlFinalResult.ForeColor = System.Drawing.Color.Red
        Else
            If StrNull2Double(lblPercentage.Text) < 70 Then
                lblResult.Text = "ไม่ผ่าน"
                lblResult.ForeColor = System.Drawing.Color.Red
                ddlFinalResult.SelectedValue = "N"
                ddlFinalResult.ForeColor = System.Drawing.Color.Red
            Else
                lblResult.Text = "ผ่าน"
                lblResult.ForeColor = System.Drawing.Color.Green
                ddlFinalResult.SelectedValue = "Y"
                ddlFinalResult.ForeColor = System.Drawing.Color.Green
            End If
        End If

    End Sub
    Private Sub Assessment_Save(RequestUID As Long)
        Dim ctlA As New AssessmentController
        ctlA.Assessment_Save(RequestUID, StrNull2Zero(hdLocationUID.Value), Request.Cookies("UserID").Value)
    End Sub
    Private Sub cmdSave_Click(sender As Object, e As EventArgs) Handles cmdSave.Click

        'CalculateScore() 
        Dim NetScore, NetPercentage As Double
        Dim FinalResult As String

        NetScore = StrNull2Double(txtFinalScore.Text)
        NetPercentage = StrNull2Double(lblFinalPercent.Text)
        FinalResult = ddlFinalResult.SelectedValue

        Dim AsmStatus As String
        If StrNull2Double(lblPercentage.Text) < 70 Then
            AsmStatus = "N"
        Else
            AsmStatus = "Y"
        End If

        Assessment_Save(StrNull2Long(hdRequestUID.Value))

        If Convert.ToInt32(Request.Cookies("ROLE_ID").Value) = 1 Then
            ctlA.GPP_Assessment_Save(StrNull2Zero(hdGPPUID.Value), StrNull2Zero(hdRequestUID.Value), StrNull2Zero(hdLocationUID.Value), StrNull2Double(lblTotalScore.Text), NetScore, NetPercentage, AsmStatus, "", StrNull2Zero(Request.Cookies("userid").Value))
        Else
            ctlA.GPP_Assessment_Save(StrNull2Zero(hdGPPUID.Value), StrNull2Zero(hdRequestUID.Value), StrNull2Zero(hdLocationUID.Value), StrNull2Double(lblTotalScore.Text), StrNull2Double(txtFinalScore.Text), StrNull2Double(lblFinalPercent.Text), ddlFinalResult.SelectedValue, txtRemark.Text, StrNull2Zero(Request.Cookies("userid").Value))
        End If

        'ctlA.Assessment_UpdateGPP(StrNull2Long(hdRequestUID.Value), StrNull2Zero(hdLocationUID.Value), StrNull2Double(lblNetScore.Text), StrNull2Double(lblTotalScore.Text), StrNull2Double(lblPercentage.Text), StrNull2Zero(Request.Cookies("userid").Value))

        Dim S2Q1, S3Q2, S3Q4, S3Q5 As Double

        If chkS2Q1.Checked = True Then 'ตอบว่าไม่มี
            S2Q1 = -1
        Else
            If optS2Q1.SelectedValue = Nothing Then 'ไม่ตอบอะไรเลย
                S2Q1 = -2
            Else 'มีคะแนน
                S2Q1 = StrNull2GPPVal(optS2Q1.SelectedValue)
            End If
        End If


        If chkS3Q2.Checked = True Then 'ตอบว่าไม่มี
            S3Q2 = -1
        Else
            If optS3Q2.SelectedValue = Nothing Then 'ไม่ตอบอะไรเลย
                S3Q2 = -2
            Else 'มีคะแนน
                S3Q2 = StrNull2GPPVal(optS3Q2.SelectedValue)
            End If
        End If

        If chkS3Q4.Checked = True Then 'ตอบว่าไม่มี
            S3Q4 = -1
        Else
            If optS3Q4.SelectedValue = Nothing Then 'ไม่ตอบอะไรเลย
                S3Q4 = -2
            Else 'มีคะแนน
                S3Q4 = StrNull2GPPVal(optS3Q4.SelectedValue)
            End If
        End If
        If chkS3Q5.Checked = True Then 'ตอบว่าไม่มี
            S3Q5 = -1
        Else
            If optS3Q5.SelectedValue = Nothing Then 'ไม่ตอบอะไรเลย
                S3Q5 = -2
            Else 'มีคะแนน
                S3Q5 = StrNull2GPPVal(optS3Q5.SelectedValue)
            End If
        End If


        hdGPPUID.Value = ctlA.GPP_Assessment_GetUID(StrNull2Zero(hdRequestUID.Value)).ToString()

        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 1, StrNull2GPPVal(optS1Q1.SelectedValue), 2, StrNull2Double(lblScoreS1Q1.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 2, StrNull2GPPVal(optS1Q2.SelectedValue), 1, StrNull2Double(lblScoreS1Q2.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 3, StrNull2GPPVal(optS1Q3.SelectedValue), 1, StrNull2Double(lblScoreS1Q3.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 4, StrNull2GPPVal(optS1Q4.SelectedValue), 1, StrNull2Double(lblScoreS1Q4.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 5, StrNull2GPPVal(optS1Q5.SelectedValue), 1, StrNull2Double(lblScoreS1Q5.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 6, StrNull2GPPVal(optS1Q6.SelectedValue), 1, StrNull2Double(lblScoreS1Q6.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 7, StrNull2GPPVal(optS1Q7.SelectedValue), 2, StrNull2Double(lblScoreS1Q7.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 8, StrNull2GPPVal(optS1Q8.SelectedValue), 2, StrNull2Double(lblScoreS1Q8.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 9, StrNull2GPPVal(optS1Q9.SelectedValue), 2, StrNull2Double(lblScoreS1Q9.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 10, S2Q1, 2, StrNull2Double(lblScoreS2Q1.Text), StrNull2Zero(Request.Cookies("userid").Value))
        'ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 10, StrNull2GPPVal(optS2Q1.SelectedValue), 2, StrNull2Double(lblScoreS2Q1.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 11, StrNull2GPPVal(optS2Q2.SelectedValue), 2, StrNull2Double(lblScoreS2Q2.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 12, StrNull2GPPVal(optS2Q3.SelectedValue), 1, StrNull2Double(lblScoreS2Q3.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 13, StrNull2GPPVal(optS2Q4.SelectedValue), 1, StrNull2Double(lblScoreS2Q4.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 14, StrNull2GPPVal(optS2Q5.SelectedValue), 1, StrNull2Double(lblScoreS2Q5.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 15, StrNull2GPPVal(optS2Q6.SelectedValue), 1, StrNull2Double(lblScoreS2Q6.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 16, StrNull2GPPVal(optS3Q1.SelectedValue), 2, StrNull2Double(lblScoreS3Q1.Text), StrNull2Zero(Request.Cookies("userid").Value))

        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 17, S3Q2, 1, StrNull2Double(lblScoreS3Q2.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 18, StrNull2GPPVal(optS3Q3.SelectedValue), 1, StrNull2Double(lblScoreS3Q3.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 19, S3Q4, 1, StrNull2Double(lblScoreS3Q4.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 20, S3Q5, 1, StrNull2Double(lblScoreS3Q5.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 21, StrNull2GPPVal(optS4Q1.SelectedValue), 2, StrNull2Double(lblScoreS4Q1.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 22, StrNull2GPPVal(optS4Q2.SelectedValue), 2, StrNull2Double(lblScoreS4Q2.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 23, StrNull2GPPVal(optS4Q3.SelectedValue), 2, StrNull2Double(lblScoreS4Q3.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 24, StrNull2GPPVal(optS4Q4.SelectedValue), 1, StrNull2Double(lblScoreS4Q4.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 25, StrNull2GPPVal(optS4Q5.SelectedValue), 1, StrNull2Double(lblScoreS4Q5.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 26, StrNull2GPPVal(optS4Q6.SelectedValue), 1, StrNull2Double(lblScoreS4Q6.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 27, StrNull2GPPVal(optS4Q7.SelectedValue), 2, StrNull2Double(lblScoreS4Q7.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 28, StrNull2GPPVal(optS5Q1.SelectedValue), 2, StrNull2Double(lblScoreS5Q1.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 29, StrNull2GPPVal(optS5Q2.SelectedValue), 2, StrNull2Double(lblScoreS5Q2.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 30, StrNull2GPPVal(optS5Q3.SelectedValue), 2, StrNull2Double(lblScoreS5Q3.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 31, StrNull2GPPVal(optS5Q4.SelectedValue), 2, StrNull2Double(lblScoreS5Q4.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 32, StrNull2GPPVal(optS5Q5.SelectedValue), 2, StrNull2Double(lblScoreS5Q5.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 33, StrNull2GPPVal(optS5Q6.SelectedValue), 2, StrNull2Double(lblScoreS5Q6.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 34, StrNull2GPPVal(optS5Q7.SelectedValue), 2, StrNull2Double(lblScoreS5Q7.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 35, StrNull2GPPVal(optS5Q8.SelectedValue), 1, StrNull2Double(lblScoreS5Q8.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 36, StrNull2GPPVal(optS5Q9.SelectedValue), 1, StrNull2Double(lblScoreS5Q9.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 37, StrNull2GPPVal(optS5Q10.SelectedValue), 1, StrNull2Double(lblScoreS5Q10.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 38, StrNull2GPPVal(optS5Q11.SelectedValue), 1, StrNull2Double(lblScoreS5Q11.Text), StrNull2Zero(Request.Cookies("userid").Value))
        ctlA.GPP_AssessmentScore_Save(StrNull2Zero(hdGPPUID.Value), 39, StrNull2GPPVal(optS5Q12.SelectedValue), 1, StrNull2Double(lblScoreS5Q12.Text), StrNull2Zero(Request.Cookies("userid").Value))


        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalSuccess(this,'Success','บันทึกข้อมูลเรียบร้อย');", True)
    End Sub

    Private Sub cmdBack_Click(sender As Object, e As EventArgs) Handles cmdBack.Click
        Response.Redirect("RequestDetail?id=" & Request("id"))
    End Sub

    Private Sub LoadImg()
        dt = ctlM.Media_Get(StrNull2Zero(hdRequestUID.Value), StrNull2Zero(hdLocationUID.Value), "G", StrNull2Long(hdAccID.Value))
        grdImg.DataSource = dt
        grdImg.DataBind()

        If dt.Rows.Count >= 4 Then
            Label2.Text = "ท่านได้อัพโหลดไฟล์ครบ 4 ไฟล์แล้ว ไม่สามารถอัพโหลดเพิ่มได้อีก"
            cmdUpImg.Enabled = False
            Label2.Visible = True
        Else
            Label2.Visible = False
            cmdUpImg.Enabled = True
        End If

    End Sub
    Protected Sub cmdUpImg_Click(sender As Object, e As EventArgs) Handles cmdUpImg.Click
        UploadFiles(FileUpload1, StrNull2Zero(hdAccID.Value), "")
        LoadImg()
    End Sub
    Private Sub UploadFiles(ByVal Fileupload As Object, REFUID As Integer, sCode As String)
        Dim SEQNO As String
        Dim sfileName As String = ""

        UploadDirectory = Server.MapPath("imageUploads/" & hdLocationUID.Value & "/GPP/")

        If Fileupload.HasFiles Then
            For Each uploadedFile As HttpPostedFile In Fileupload.PostedFiles
                Dim fileExtname As String = Path.GetExtension(uploadedFile.FileName).ToLower()

                If fileExtname <> ".jpg" And fileExtname <> ".jpeg" And fileExtname <> ".png" Then
                    ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalWarningInfo(this,'ผลการตรวจสอบ','ไฟล์รูปภาพต้องมีนามสกุล .jpg, .jpeg, .png เท่านั้น');", True)
                    Exit Sub
                End If
                If (Fileupload.PostedFile.ContentLength / 1024) > 1024 Then
                    ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalWarningInfo(this,'ผลการตรวจสอบ','ไฟล์มีขนาดใหญ่เกิน 1024 Kb. ไม่สามารถอัพโหลดได้');", True)
                    Exit Sub
                End If


                If ctlM.Media_GetCount(StrNull2Zero(hdRequestUID.Value), StrNull2Zero(hdLocationUID.Value), "G", REFUID) >= 4 Then
                    Exit Sub
                End If
                SEQNO = ctlM.Media_GetLastSEQ(StrNull2Zero(hdRequestUID.Value), StrNull2Zero(hdLocationUID.Value), "G", REFUID)
                sfileName = "G_" & REFUID & "_" & SEQNO.ToString() & fileExtname

                Dim objfile As FileInfo = New FileInfo("imageUploads/" & hdLocationUID.Value & "/GPP/" & sfileName)
                If objfile.Exists Then
                    objfile.Delete()
                End If
                uploadedFile.SaveAs(System.IO.Path.Combine(UploadDirectory, sfileName))
                ctlM.Media_Save(StrNull2Zero(hdRequestUID.Value), hdLocationUID.Value, "G", REFUID, SEQNO, sfileName, Request.Cookies("UserID").Value)
            Next
        End If
    End Sub

    Private Sub grdImg_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdImg.RowCommand
        If TypeOf e.CommandSource Is WebControls.ImageButton Then
            Dim ButtonPressed As WebControls.ImageButton = e.CommandSource
            Select Case ButtonPressed.ID
                Case "imgView"
                    PreviewPicture("", "", e.CommandArgument())
                Case "imgDelFile"
                    DeleteImage(e.CommandArgument)
                    ctlM.Media_Delete(e.CommandArgument)
                    LoadImg()
            End Select
        End If
    End Sub

    Private Sub grdImg_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles grdImg.RowDataBound
        If e.Row.RowType = ListItemType.AlternatingItem Or e.Row.RowType = ListItemType.Item Then

            Dim scriptString As String = "javascript:return confirm(""ต้องการลบ ข้อมูลนี้ ?"");"
            Dim imgD As ImageButton = e.Row.Cells(3).FindControl("imgDelFile")
            imgD.Attributes.Add("onClick", scriptString)

        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "this.originalcolor=this.style.backgroundColor;" + " this.style.backgroundColor='#d0e8ff';")
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalcolor;")

        End If
    End Sub
    Private Sub PreviewPicture(Fname As String, Desc As String, filePath As String)
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalWindow(this,'" + Fname + "','" + Desc + "','" + fPath + filePath + "');", True)
    End Sub

    Protected Sub optS1Q1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS1Q1.SelectedIndexChanged
        CalculateScore()
    End Sub
    Protected Sub optS1Q2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS1Q2.SelectedIndexChanged
        CalculateScore()
    End Sub
    Protected Sub optS1Q3_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS1Q3.SelectedIndexChanged
        CalculateScore()
    End Sub
    Protected Sub optS1Q4_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS1Q4.SelectedIndexChanged
        CalculateScore()
    End Sub
    Protected Sub optS1Q5_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS1Q5.SelectedIndexChanged
        CalculateScore()
    End Sub
    Protected Sub optS1Q6_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS1Q6.SelectedIndexChanged
        CalculateScore()
    End Sub
    Protected Sub optS1Q7_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS1Q7.SelectedIndexChanged
        CalculateScore()
    End Sub
    Protected Sub optS1Q8_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS1Q8.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS1Q9_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS1Q9.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS2Q1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS2Q1.SelectedIndexChanged
        chkS2Q1.Checked = False
        CalculateScore()
    End Sub
    Private Sub optS2Q2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS2Q2.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS2Q3_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS2Q3.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS2Q4_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS2Q4.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS2Q5_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS2Q5.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS2Q6_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS2Q6.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS3Q1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS3Q1.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS3Q2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS3Q2.SelectedIndexChanged
        chkS3Q2.Checked = False
        CalculateScore()
    End Sub

    Private Sub optS3Q3_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS3Q3.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS3Q4_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS3Q4.SelectedIndexChanged
        chkS3Q4.Checked = False
        CalculateScore()
    End Sub

    Private Sub optS3Q5_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS3Q5.SelectedIndexChanged
        chkS3Q5.Checked = False
        CalculateScore()
    End Sub

    Private Sub optS4Q1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS4Q1.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS4Q2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS4Q2.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS4Q3_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS4Q3.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS4Q4_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS4Q4.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS4Q5_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS4Q5.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS4Q6_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS4Q6.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS4Q7_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS4Q7.SelectedIndexChanged
        CalculateScore()
    End Sub

    Private Sub optS5Q1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q1.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS5Q2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q2.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS5Q3_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q3.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS5Q4_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q4.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS5Q5_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q5.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS5Q6_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q6.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS5Q7_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q7.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS5Q8_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q8.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS5Q9_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q9.SelectedIndexChanged
        CalculateScore()
    End Sub
    Private Sub optS5Q10_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q10.SelectedIndexChanged
        CalculateScore()
    End Sub
    Protected Sub optS5Q11_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q11.SelectedIndexChanged
        CalculateScore()
    End Sub
    Protected Sub optS5Q12_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optS5Q12.SelectedIndexChanged
        CalculateScore()
    End Sub
    Protected Sub imgS1Q1_Click(sender As Object, e As EventArgs) Handles imgS1Q1.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "1"
        lblTopic.Text = "ข้อที่ 1.1 สถานที่ขายยาแผนปัจจุบัน ต้องมีพื้นที่ขายให้คำปรึกษาและแนะนำการใช้ยา ติดต่อกันขนาดไม่น้อยกว่า 8 ตารางเมตรทั้งนี้ไม่รวมถึงพื้นที่เก็บสำรองยา โดยความยาวของด้านที่สั้นที่สุดของพื้นที่ต้องไม่น้อยกว่า 2 เมตร (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'1');", True)
    End Sub
    Protected Sub imgS1Q2_Click(sender As Object, e As EventArgs) Handles imgS1Q2.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "2"
        lblTopic.Text = "ข้อที่ 1.2 หากมีพื้นที่เก็บสำรองยาเป็นการเฉพาะ ต้องมีพื้นที่เพียงพอ เก็บอย่างเป็นระเบียบ เหมาะสม และไม่วางยาสัมผัสกับพื้นโดยตรง"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'2');", True)
    End Sub

    Protected Sub imgS1Q3_Click(sender As Object, e As EventArgs) Handles imgS1Q3.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "3"
        lblTopic.Text = "ข้อ 1.3 บริเวณสำหรับให้คำปรึกษาและแนะนำการใช้ยา ต้องเป็นสัดส่วนแยกออกจากส่วนบริการอื่นอย่างชัดเจน มีพื้นที่พอสำหรับการให้คำปรึกาและการจัดเก็บประวัติ รวมทั้งจัดให้มีโต๊ะเก้าอี้สำหรับเภสัชกรและผู้มารับคำปรึกษาอยู่ในบริเวณดังกล่าวพร้อมทั้งมีป้ายแสดงชัดเจน"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'3');", True)
    End Sub
    Protected Sub imgS1Q4_Click(sender As Object, e As EventArgs) Handles imgS1Q4.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "4"
        lblTopic.Text = "ข้อที่ 1.4 สถานที่ขายยาต้องมีความมั่นคง มีทะเบียนบ้านที่ออกให้โดยส่วนราชการที่เกี่ยวข้องในกรณีที่เป็นอาคารชุด ต้องมีพื้นที่อนุญาตให้ประกอบกิจการไม่ใช่ที่พักอาศัย (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'4');", True)
    End Sub
    Protected Sub imgS1Q5_Click(sender As Object, e As EventArgs) Handles imgS1Q5.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "5"
        lblTopic.Text = "ข้อที่ 1.5 สถานที่ขายยาต้องมีความแข็งแรงก่อสร้างด้วยวัสดุที่คงทนถาวร เป็นสัดส่วนชัดเจน (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'5');", True)
    End Sub
    Protected Sub imgS1Q6_Click(sender As Object, e As EventArgs) Handles imgS1Q6.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "6"
        lblTopic.Text = "ข้อที่ 1.6 สถานที่ขายยาต้องถูกสุขลักษณะ สะอาด เป็นระเบียบเรียบร้อย มีการควบคุมป้องกันสัตว์แมลงมารบกวน ไม่มีสัตว์เลี้ยงในบริเวณขายขาย และอากาศถ่ายเทสะดวก"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'6');", True)
    End Sub
    Protected Sub imgS1Q7_Click(sender As Object, e As EventArgs) Handles imgS1Q7.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "7"
        lblTopic.Text = "ข้อที่ 1.7 สถานที่ขายยาต้องมีสภาพเหมาะสมต่อการรักษาคุณภาพยา โดยในพื้นที่ขายยาและเก็บสำรองยา ต้องมีการถ่ายเทอากาศที่ดี แห้ง สามารถควบคุมอุณหภูมิให้ไม่เกิน 30 องศาเซลเซียส และสามารถป้องกันแสงแดดไม่ให้ส่องโดยตรงถึงผลิตภัณฑ์ยา (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'7');", True)
    End Sub
    Protected Sub imgS1Q8_Click(sender As Object, e As EventArgs) Handles imgS1Q8.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "8"
        lblTopic.Text = "ข้อที่ 1.8 สถานที่ขายยาต้องมีแสงสว่างเพียงพอในการอ่านเอกสาร อ่านฉลากผลิตภัณฑ์ยาและป้ายแสดงต่าง ๆ ได้อย่างชัดเจน"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'8');", True)
    End Sub
    Protected Sub imgS1Q9_Click(sender As Object, e As EventArgs) Handles imgS1Q9.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "9"
        lblTopic.Text = "ข้อที่ 1.9 บริเวณจัดวางยาอันตราย และยาควบคุมพิเศษในพื้นที่ของยา จะต้อง " & vbCrLf & "1.9.1 มีพื้นที่เพียงพอในการจัดวางยาแยกตามประเภทของยาและสามารถติดป้ายแสดงประเภทของยาได้ชัดเจนตามหลักวิชาการ" & vbCrLf & "1.9.2 จัดให้มีวัสดุทึบใช้ปิดบังบริเวณที่จัดวางยาอันตราย ยาควบคุมพิเศษ สำหรับปิดในเวลาที่เภสัชกรหรือผู้มีหน้าที่ปฏิบัติการไม่อยู่ปฏิบัติหน้าที่ และจัดให้มีป้ายแจ้งให้ผู้มารับบริการทราบว่าเภสัชกรหรือผู้มีหน้าที่ปฏิบัติการไม่อยู่ (Critical lDefect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'9');", True)
    End Sub
    Protected Sub imgS2Q1_Click(sender As Object, e As EventArgs) Handles imgS2Q1.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "10"
        lblTopic.Text = "ข้อที่ 2.1 ตู้เย็น จำนวน 1 เครื่อง (เฉพาะกรณีมียาที่ต้องเก็บรักษา ในอุณหภูมิที่ต่ำกว่าอุณหภูมิห้อง) ในสภาพที่ใช้งานได้ตามมาตรฐาน มีพื้นที่เพียงพอสำหรับการจัดเก็บยาแต่ละชนิดเป็นสัดส่วนเฉพาะ ไม่ใช่เก็บของปะปนกับสิ่งของอื่น (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'10');", True)
    End Sub
    Protected Sub imgS2Q2_Click(sender As Object, e As EventArgs) Handles imgS2Q2.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "11"
        lblTopic.Text = "ข้อ 2.2 ถาดนับเม็ดยาอย่างน้อย 2 ถาดในสภาพใช้งานได้ดี และกรณีต้องมีการแบ่งบรรจุยากลุ่มเพนนิซิลิน หรือยากลุ่มซัลโฟนาไมด์ หรือยากลุ่มต้านการอักเสบชนิดที่ไม่ใช่สเตียรอยด์ (NSAID) ทั้งนี้อุปกรณ์นับเม็ดยาสำหรับยาในกลุ่มเพนนิซิลิน หรือยากลุ่มซัลโฟนาไมด์ หรือยากลุ่มต้านการอักเสบชนิดที่ไม่ใช่สเตียรอยด์ (NSAID) ให้แยกใช้เด็ดขาดจากยากลุ่มอื่นๆ\(Critical Defect) "
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'11');", True)
    End Sub
    Protected Sub imgS2Q3_Click(sender As Object, e As EventArgs) Handles imgS2Q3.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "12"
        lblTopic.Text = "ข้อที่ 2.3 เครื่องวัดความดันโลหิต (ชนิดอัตโนมัติ) จำนวน 1 เครื่อง ในสภาพที่ใช้งานได้ตามมาตรฐาน (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'12');", True)
    End Sub
    Protected Sub imgS2Q4_Click(sender As Object, e As EventArgs) Handles imgS2Q4.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "13"
        lblTopic.Text = "ข้อที่ 2.4 เครื่องชั่งน้ำหนักสำหรับผู้มารับบริการ จำนวน 1 เครื่อง ในสภาพที่ใช้งานได้ดี"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'13');", True)
    End Sub
    Protected Sub imgS2Q5_Click(sender As Object, e As EventArgs) Handles imgS2Q5.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "14"
        lblTopic.Text = "ข้อที่ 2.5 มีอุปกรณ์ที่วัดส่วนสูงสำหรับผู้มารับบริการจำนวน 1 เครื่อง ในสภาพที่ใช้งานได้ดี (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'14');", True)
    End Sub
    Protected Sub imgS2Q6_Click(sender As Object, e As EventArgs) Handles imgS2Q6.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "15"
        lblTopic.Text = "ข้อที่ 2.6 อุปกรณ์สำหรับดับเพลิง จำนวน 1 เครื่องในสภาพที่สามารถพร้อมใช้งานได้อย่างมีประสิทธิภาพ อยู่ในบริเวรสถานที่เก็บยา (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'15');", True)
    End Sub
    Protected Sub imgS3Q1_Click(sender As Object, e As EventArgs) Handles imgS3Q1.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "16"
        lblTopic.Text = "ข้อที่ 3.1 เภสัชกรเป็นผู้มีความรู้ ความสามารถในการให้การบริการทางเภสัชกรรมชุมชน"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'16');", True)
    End Sub
    Protected Sub imgS3Q2_Click(sender As Object, e As EventArgs) Handles imgS3Q2.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "17"
        lblTopic.Text = "ข้อที่ 3.2 พนักงานร้านยา ต้องมีความรู้เกี่ยวกับกฎหมายยา และงานที่ได้รับมอบหมายจนสามารถปฏิบัติงานได้ดี และผ่านการอบรมอย่างต่อเนื่องและเพียงพอ"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'17');", True)
    End Sub
    Protected Sub imgS3Q3_Click(sender As Object, e As EventArgs) Handles imgS3Q3.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "18"
        lblTopic.Text = "ข้อที่ 3.3 เภสัชกรจะต้องแต่งกายด้วยเสื้อกาวน์สีขาวติดเครื่องหมายสัญลักษณ์ของสภาเภสัชกรรม และแสดงตนว่าเป็นเภสัชกร ทั้งนี้เป็นไปตามสมควรเหมาะสมแก่ฐานะและศักดิ์ศรีแห่งวิชาชีพเภสัชกรรม แสดงตนให้แตกต่างจากพนักงานร้านยาและบุคลากรอื่นภายในร้านขายยา"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'18');", True)
    End Sub
    Protected Sub imgS3Q4_Click(sender As Object, e As EventArgs) Handles imgS3Q4.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "19"
        lblTopic.Text = "ข้อที่ 3.4 การแต่งกายพนักงานร้านยาและบุคลากรอื่นภายในร้านขายยา ต้องใส่สีเสื้อ ป้ายแสดงตนไม่สื่อไปในทางที่จะก่อให้เกิดความเข้าใจว่าเป็นเภสัชกร"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'19');", True)
    End Sub
    Protected Sub imgS3Q5_Click(sender As Object, e As EventArgs) Handles imgS3Q5.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "20"
        lblTopic.Text = "ข้อที่ 3.5 มีการแบ่งแยกบทบาท หน้าที่ และความรับผิดชอบของเภสัชกร พนักงานร้านยา และบุคลากรอื่นภายในร้านขายยาในการให้บริการไว้อย่างชัดเจน โดยคำนึงถึงความถูกต้องตามกฎหมายว่าด้วยยาและกฎหมายว่าด้วยวิชาชีพเภสัชกรรม"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'20');", True)
    End Sub
    Protected Sub imgS4Q1_Click(sender As Object, e As EventArgs) Handles imgS4Q1.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "21"
        lblTopic.Text = "ข้อที่ 4.1 ต้องมีการคัดเลือกยา และจัดหายาจากผู้ผลิต ผู้นำเข้า ผู้จำหน่ายที่ถูกต้องตามกฎหมายว่าด้วยยาและมีมาตรฐานตามหลักเกณฑ์วิธีการที่ดีในการผลิตจัดเก็บ และการขนส่ง (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'21');", True)
    End Sub
    Protected Sub imgS4Q2_Click(sender As Object, e As EventArgs) Handles imgS4Q2.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "22"
        lblTopic.Text = "ข้อที่ 4.2 ต้องมีการเก็บรักษายา ภายใต้สภาวะอุณหภูมิที่เหมาะสม หลีกเลี่ยง แสงแดด เป็นไปตามหลักวิชาการเพื่อให้ยานั้นคงคุณภาพที่ดี"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'22');", True)
    End Sub
    Protected Sub imgS4Q3_Click(sender As Object, e As EventArgs) Handles imgS4Q3.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "23"
        lblTopic.Text = "ข้อที่ 4.3 ต้องมีระบบตรวจสอบยาที่หมดอายุหรือเสื่อมคุณภาพที่มีประสิทธิภาพ เพื่อไม่ให้มีไว้ ณ จุดจ่ายยา (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'23');", True)
    End Sub
    Protected Sub imgS4Q4_Click(sender As Object, e As EventArgs) Handles imgS4Q4.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "24"
        lblTopic.Text = "ข้อที่ 4.4 ต้องมีระบบการส่งคืนหรือทำลายยาที่หมดอายุ หรือยาเสื่อมคุณภาพให้ชัดเจน ถูกต้องตามหลักวิชาการ ไม่เป็นปัญหากับสิ่งแวดล้อม รวมถึงระบบการป้องกันการนำยาดังกล่าวไปจำหน่าย"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'24');", True)
    End Sub
    Protected Sub imgS4Q5_Click(sender As Object, e As EventArgs) Handles imgS4Q5.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "25"
        lblTopic.Text = "ข้อที่ 4.5 ต้องมีระบบการตรวจสอบคุณภาพยาคืนหรือยาเปลี่ยน ก่อนกลับมาจำหน่ายโดยคำนึงถึงประสิทธิภาพของยาและความปลอดภัยของผู้ใช้ยา"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'25');", True)
    End Sub
    Protected Sub imgS4Q6_Click(sender As Object, e As EventArgs) Handles imgS4Q6.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "26"
        lblTopic.Text = "ข้อที่ 4.6 ต้องจัดให้มีระบบเอกสารที่เกี่ยวกับการจัดหา จัดการคลังสินค้าและการจำหน่ายให้ถูกต้อง เป็นปัจจุบันสามารถสืบย้อนได้"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'26');", True)
    End Sub
    Protected Sub imgS4Q7_Click(sender As Object, e As EventArgs) Handles imgS4Q7.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "27"
        lblTopic.Text = "ข้อที่ 4.7 ต้องเลือกภาชนะบรรจุที่เหมาะสม เพื่อป้องกันไม่ให้ยาเสื่อมสภาพก่อนเวลาอันสมควรพร้อมฉลากยา"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'27');", True)
    End Sub
    Protected Sub imgS5Q1_Click(sender As Object, e As EventArgs) Handles imgS5Q1.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "28"
        lblTopic.Text = "ข้อที่ 5.1 การให้บริการทางเภสัชกรรม ตามหน้าที่ที่กฎหมายว่าด้วยยาและกฎหมายว่าด้วยวิชาชีพเภสัชกรรมต้องปฏิบัติโดยเภสัชกร 5.1.1 มีป้ายตามที่กฎหมายกำหนดและติดตั้งถูกต้อง-ป้ายสถานที่ขายยาแผนปัจจุบัน-ป้ายเภสัชกรผู้มีหน้าที่ปฏิบัติการ 5.1.2 มีใบอนุญาตตามที่กฎหมายกำหนดและติดตั้งถูกต้อง-ใบอนุญาตขายยาแผนปัจจุบัน-ใบประกอบวิชาชีพเภสัชกรรมของเภสัชกรผู้มีหน้าที่ปฏิบัติการ 5.1.3 บัญชียาประเภทต่าง ๆ (เช่ยน ขย.๕ ขย.๑๑) และบันทึกถูกต้อง (Critical Defect)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'28');", True)
    End Sub
    Protected Sub imgS5Q2_Click(sender As Object, e As EventArgs) Handles imgS5Q2.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "29"
        lblTopic.Text = "ข้อที่ 5.2 ต้องซักถามข้อมูลที่จำเป็นของผู้ที่มารับบริการ เพื่อประกอบการพิจารณาก่อนเลือกสรรยาหรือผลิตภัณฑ์สุขภาพที่มีประสิทธิภาพ ปลอดภัย เหมาะสมกับผู้ป่วยตามหลักวิชาการ สมเหตุสมผลตามมาตรฐานการประกอบวิชาชีพ"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'29');", True)
    End Sub
    Protected Sub imgS5Q3_Click(sender As Object, e As EventArgs) Handles imgS5Q3.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "30"
        lblTopic.Text = "ข้อที่ 5.3 จัดให้มีฉลากบนซองบรรจุยา หรือภาชนะบรรจุยาอันตรายและยาควบคุมพิเศษที่ส่งมอบให้ผู้รับบริการโดยต้องแสดงข้อมูลอย่างน้อย ดังนี้ 5.3.1 ชื่อ ที่อยู่ของร้ายขายยาและหมายเลขโทรศัพท์ที่สามารถติดต่อได้ 5.3.2 ข้อมูลเพื่อให้ผู้รับบริการใช้ยาได้อย่างถูกต้อง เหมาะสม ปลอดภัย ติดตามได้ดังนี้ – วันที่จ่าย-ชื่อผู้รับบริการ-ชื่อยาที่เป็นชื่อสามัญทางยา หรือชื่อการค้า ความแรงจำนวนจ่าย-ข้อบ่งใช้-วิธีใช้ยาที่ชัดเจนเข้าใจง่าย-ฉลากช่วย คำแนะนำ คำเตือน หรือเอกสารให้ความรู้เพิ่มเติม (ถ้าจำเป็น) – ลายมือชื่อเภสัชกร"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'30');", True)
    End Sub
    Protected Sub imgS5Q4_Click(sender As Object, e As EventArgs) Handles imgS5Q4.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "31"
        lblTopic.Text = "ข้อที่ 5.4 การส่งมอบยาอันตราย ยาควบคุมพิเศษ ให้กับผู้มารับบริการเฉพาะราย ต้องกระทำโดยเภสัชกรผู้มีหน้าที่ปฏิบัติการเท่านั้น พร้อมให้คำแนะนำตามหลักวิชาการและจรรยาบรรณ แห่งวิชาชีพ โดยต้องให้ข้อมูลดังนี้-ชื่อยา-ข้อบ่งใช้-ขนาด และวิธีการใช้-ผลข้างเคียง (side effect) (ถ้ามี) และอาการไม่พึงประสงค์จากการใช้ยา (Adverse Drug Reaction) ที่อาจเกิดขึ้น-ข้อควรระวังและข้อควรปฏิบัติในการใช้ยา-การปฏิบัติเมื่อเกิดปัญหาจากการใช้ยา)"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'31');", True)
    End Sub
    Protected Sub imgS5Q5_Click(sender As Object, e As EventArgs) Handles imgS5Q5.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "32"
        lblTopic.Text = "ข้อที่ 5.5 มีกระบวนการในการป้องกันการแพ้ยาซ้ำของผู้มารับบริการที่มีประสิทธิภาพเหมาะสม"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'32');", True)
    End Sub
    Protected Sub imgS5Q6_Click(sender As Object, e As EventArgs) Handles imgS5Q6.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "33"
        lblTopic.Text = "ข้อที่ 5.6 มีกระบวนการคัดกรองและส่งต่อผู้ป่วยที่เหมาะสม"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'33');", True)
    End Sub
    Protected Sub imgS5Q7_Click(sender As Object, e As EventArgs) Handles imgS5Q7.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "34"
        lblTopic.Text = "ข้อที่ 5.7 กรณีที่มีการผลิตยาตามใบสั่งยาของผู้ประกอบวิชาชีพเวชกรรมหรือของผู้ประกอบโรคศิลปะที่สั่งสำหรับคนไข้เฉพาะรายหรือตามใบสั่งยาของผู้ประกอบวิชาชีพการสัตวแพทย์ สำหรับสัตว์เฉพาะรายและการแบ่งบรรจุยาในสถานที่ขายยาให้คำนึงถึงการปนเปื้อน การแพ้ยา โดยต้องจัดให้มีสถานที่ อุปกรณ์ตามที่กำหนดและเป็นไปตามมาตรฐานการประกอบวิชาชพีเภสัชกรรมด้านการผลิตยาสำหรับคนไข้เฉพาะรายของสภาเภสัชกรรม"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'34');", True)
    End Sub
    Protected Sub imgS5Q8_Click(sender As Object, e As EventArgs) Handles imgS5Q8.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "35"
        lblTopic.Text = "ข้อที่ 5.8 ต้องจัดให้มีกระบวนการเฝ้าระวังอาการไม่พึงประสงค์ พฤติกรรมการใช้ยาไม่เหมาะสม ปัญหาคุณภาพยา และรายงานให้หน่วยงานที่เกี่ยวข้องทราบ"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'35');", True)
    End Sub
    Protected Sub imgS5Q9_Click(sender As Object, e As EventArgs) Handles imgS5Q9.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "36"
        lblTopic.Text = "ข้อที่ 5.9 จัดให้มีแหล่งข้อมูลอ้างอิงด้านยาที่เหมาะสมเชื่อถือได้ สำหรับใช้ในการให้บริการทางเภสัชกรรมเพื่อส่งเสริมการใช้ยาอย่างถูกต้อง ปลอดภัย รวมทั้งการให้บริการเภสัชสนเทศ"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'36');", True)
    End Sub
    Protected Sub imgS5Q10_Click(sender As Object, e As EventArgs) Handles imgS5Q10.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "37"
        lblTopic.Text = "ข้อที่ 5.10 การจัดวางสื่อให้ความรู้และสื่อโฆษณาสำหรับผู้มารับบริการจะต้องได้รับคำยินยอมอย่างเป็นลายลักษณ์อักษรจากเภสัชกรผู้มีหน้าที่ปฏิบัติการ และให้ถือเป็นความรับผิดชอบที่เภสัชกรผู้มีหน้าที่ปฏิบัติการจะต้องควบคุม โดยจะต้องไม่โอ้อวด ไม่บิดเบือนความจริง ไม่สร้างความเข้าใจผิดให้ผู้บริโภค และต้องผ่านการอนุญาตถูกต้องตามกฎหมาย"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'37');", True)
    End Sub
    Protected Sub imgS5Q11_Click(sender As Object, e As EventArgs) Handles imgS5Q11.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "38"
        lblTopic.Text = "ข้อที่ 5.11 การดำเนินกิจกรรมด้านสุขภาพที่เกี่ยวข้องกับผู้มารับบริการในร้านยา โดยบุคลากรอื่นซึ่งมิใช่เภสัชกรหรือพนักงานร้านยา จะต้องได้รับคำยินยอมเป็นลายลักษณ์อักษรจากเภสัชกร และให้ถือเป็นความรับผิดชอบที่เภสัชกรจะต้องควบคุมกำกับการดำเนินกิจกรรมต่าง ๆ ในสถานที่ขายยาให้ถูกต้องตามกฎหมายว่าด้วยยาหรือกฎหมายอื่นที่เกี่ยวข้องกับผลิตภัณฑ์สุขภาพนั้น ๆ รวมทั้งกฎหมายว่าด้วยวิชาชีพเภสัชกรรม"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'38');", True)
    End Sub
    Protected Sub imgS5Q12_Click(sender As Object, e As EventArgs) Handles imgS5Q12.Click
        Dim fPath As String = "imageUploads/" & hdLocationUID.Value & "/GPP/"
        hdAccID.Value = "39"
        lblTopic.Text = "ข้อที่ 5.12 ไม่จำหน่ายผลิตภัณฑ์ยาสูบและเครื่องดื่มที่มีส่วนผสมของแอลกฮอล์"
        LoadImg()
        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "MessageAlert", "openModalUpload(this,'39');", True)
    End Sub

    Protected Sub txtFinalScore_TextChanged(sender As Object, e As EventArgs) Handles txtFinalScore.TextChanged
        lblFinalPercent.Text = ((StrNull2Double(txtFinalScore.Text) * 100) / StrNull2Double(lblTotalScore.Text)).ToString("##.##")

        If StrNull2Zero(lblScoreS1Q1.Text) <= 0 Or StrNull2Zero(lblScoreS1Q4.Text) <= 0 Or StrNull2Zero(lblScoreS1Q5.Text) <= 0 Or StrNull2Zero(lblScoreS1Q7.Text) <= 0 Or StrNull2Zero(lblScoreS1Q9.Text) <= 0 Or StrNull2Zero(lblScoreS2Q1.Text) <= 0 Or StrNull2Zero(lblScoreS2Q2.Text) <= 0 Or StrNull2Zero(lblScoreS2Q3.Text) <= 0 Or StrNull2Zero(lblScoreS2Q4.Text) <= 0 Or StrNull2Zero(lblScoreS2Q5.Text) <= 0 Or StrNull2Zero(lblScoreS2Q6.Text) <= 0 Or StrNull2Zero(lblScoreS4Q1.Text) <= 0 Or StrNull2Zero(lblScoreS4Q3.Text) <= 0 Or StrNull2Zero(lblScoreS5Q1.Text) <= 0 Then

            ddlFinalResult.ForeColor = System.Drawing.Color.Red
            ddlFinalResult.SelectedValue = "N"
        Else
            If StrNull2Double(lblFinalPercent.Text) < 70 Then
                ddlFinalResult.ForeColor = System.Drawing.Color.Red
                ddlFinalResult.SelectedValue = "N"
            Else
                ddlFinalResult.ForeColor = System.Drawing.Color.Green
                ddlFinalResult.SelectedValue = "Y"
            End If
        End If
    End Sub
    Private Sub chkS2Q1_CheckedChanged(sender As Object, e As EventArgs) Handles chkS2Q1.CheckedChanged
        If chkS2Q1.Checked = True Then
            optS2Q1.ClearSelection()
            CalculateScore()
        End If
    End Sub
    Protected Sub chkS3Q2_CheckedChanged(sender As Object, e As EventArgs) Handles chkS3Q2.CheckedChanged
        If chkS3Q2.Checked = True Then
            optS3Q2.ClearSelection()
            CalculateScore()
        End If
    End Sub
    Protected Sub chkS3Q4_CheckedChanged(sender As Object, e As EventArgs) Handles chkS3Q4.CheckedChanged
        If chkS3Q4.Checked = True Then
            optS3Q4.ClearSelection()
            CalculateScore()
        End If
    End Sub
    Protected Sub chkS3Q5_CheckedChanged(sender As Object, e As EventArgs) Handles chkS3Q5.CheckedChanged
        If chkS3Q5.Checked = True Then
            optS3Q5.ClearSelection()
            CalculateScore()
        End If
    End Sub


    Private Sub DeleteImageByGroup(ImgGroup As String, RefUID As String)
        dt = ctlM.Media_GetImagePath(Request("id"), hdLocationUID.Value, ImgGroup, RefUID)
        If dt.Rows.Count > 0 Then
            Dim sPath As String = ""
            Select Case ImgGroup
                Case "S", "L", "A", "M"
                    sPath = "/Locations/"
                Case "G"
                    sPath = "/GPP/"
                Case "P", "R", "Q"
                    sPath = "/QA/"
            End Select

            For i = 0 To dt.Rows.Count - 1
                sPath = ""
                Dim objfile As FileInfo = New FileInfo(Server.MapPath("~/imageUploads/" & hdLocationUID.Value & sPath & dt.Rows(0)("FilePath")))
                If objfile.Exists Then
                    objfile.Delete()
                End If
            Next
        End If
    End Sub
    Private Sub DeleteImage(MediaUID As Integer)
        dt = ctlM.Media_GetByID(MediaUID)
        If dt.Rows.Count > 0 Then
            Dim sPath As String = ""
            Select Case dt.Rows(0)("ImageGroup")
                Case "S", "L", "A", "M"
                    sPath = "/Locations/"
                Case "G"
                    sPath = "/GPP/"
                Case "P", "R", "Q"
                    sPath = "/QA/"
            End Select

            Dim objfile As FileInfo = New FileInfo(Server.MapPath("~/imageUploads/" & hdLocationUID.Value & sPath & dt.Rows(0)("FilePath")))
            If objfile.Exists Then
                objfile.Delete()
            End If

        End If
    End Sub


End Class