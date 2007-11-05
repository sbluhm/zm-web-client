<%@ tag body-content="empty" %>
<%@ attribute name="mailbox" rtexprvalue="true" required="true" type="com.zimbra.cs.taglib.bean.ZMailboxBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="zm" uri="com.zimbra.zm" %>
<%@ taglib prefix="app" uri="com.zimbra.htmlclient" %>

<table width="100%" cellpadding="10" cellspacing="10">
    <tr>
        <td>
        <table class="ZOptionsSectionTable" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr class="ZOptionsHeaderRow">
                <td class="ImgPrefsHeader_L">
                    &nbsp;
                </td>
                <td class='ZOptionsHeader ImgPrefsHeader' >
                    <fmt:message key="optionsComposingMessages"/>
                </td>
                <td class="ImgPrefsHeader_R">
                    &nbsp;
                </td>
            </tr>
         </table>
        <table cellpadding="3" width="100%" class="ZOptionsSectionMain">
        <tr>
            <td class='ZOptionsTableLabel'>
                <fmt:message key="optionsCompose"/> :
            </td>
            <td>
                <table border="0" cellpadding="0" cellspacing="3">
                    <tr>
                        <td>
                            <input id="composeAsHTML" type="radio" name="zimbraPrefComposeFormat" value="html" <c:if test="${mailbox.prefs.composeFormat eq 'html'}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="composeAsHTML"><fmt:message key="optionsComposeAsHTML"/></label>
                        </td>
                        <td class='ZOptionsTableLabel' style='width:50px;'>
                            <label for="composeFont"><fmt:message key="optionsComposeFont"/>:</label>
                        </td>
                        <td>
                            <select name="zimbraPrefHtmlEditorDefaultFontFamily" id="composeFont">
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontFamily eq 'Arial'}"> selected</c:if> value="Arial">Arial</option>
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontFamily eq 'Times New Roman'}"> selected</c:if> value="Times New Roman">Times New Roman</option>
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontFamily eq 'Courier'}"> selected</c:if> value="Courier">Courier</option>
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontFamily eq 'Verdana'}"> selected</c:if> value="Verdana">Verdana</option>
                            </select>
                        </td>
                        <td class='ZOptionsTableLabel' style='width:50px;'>
                            <label for="composeSize"><fmt:message key="optionsComposeSize"/>:</label>
                        </td>
                        <td>
                            <select name="zimbraPrefHtmlEditorDefaultFontSize" id="composeSize">
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontSize eq '8pt'}"> selected</c:if> value="8pt">8pt</option>
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontSize eq '10pt'}"> selected</c:if> value="10pt">10pt</option>
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontSize eq '12pt'}"> selected</c:if> value="12pt">12pt</option>
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontSize eq '14pt'}"> selected</c:if> value="14pt">14pt</option>
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontSize eq '18pt'}"> selected</c:if> value="18pt">18pt</option>
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontSize eq '24pt'}"> selected</c:if> value="24pt">24pt</option>
                                <option <c:if test="${mailbox.prefs.htmlEditorDefaultFontSize eq '36pt'}"> selected</c:if> value="36pt">36pt</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input id="composeAsText" type="radio" name="zimbraPrefComposeFormat" value="text" <c:if test="${mailbox.prefs.composeFormat eq 'text'}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="composeAsText"><fmt:message key="optionsComposeAsText"/></label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <app:optSeparator/>
        <tr>
            <td class='ZOptionsTableLabel'>
                <fmt:message key="optionsReplyReplyAll"/> :
            </td>
            <td>
                <fmt:message key="optionsWhenReplying"/>:
            </td>
        </tr>
        <tr>
            <td class='ZOptionsTableLabel'>
                &nbsp;
            </td>
            <td>
                <table border="0" cellpadding="0" cellspacing="3">
                    <tr>
                        <td>
                            <input id="replyIncludeBody" type="radio" name="zimbraPrefReplyIncludeOriginalText" value="includeBody" <c:if test="${mailbox.prefs.replyIncludeBody}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="replyIncludeBody"><fmt:message key="optionsIncludeBody"/></label>
                        </td>
                        <td>
                            <input id="replyIncludeBodyWithPrefix" type="radio" name="zimbraPrefReplyIncludeOriginalText" value="includeBodyWithPrefix" <c:if test="${mailbox.prefs.replyIncludeBodyWithPrefx}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="replyIncludeBodyWithPrefix"><fmt:message key="optionsIncludeBodyWithPrefix"/></label>
                        </td>
                        <td>
                            <input id="replyIncludeAsAttachment" type="radio" name="zimbraPrefReplyIncludeOriginalText" value="includeAsAttachment" <c:if test="${mailbox.prefs.replyIncludeAsAttachment}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="replyIncludeAsAttachment"><fmt:message key="optionsIncludeAsAttachment"/></label>
                        </td>
                        <td>
                            <input id="replyIncludeNone" type="radio" name="zimbraPrefReplyIncludeOriginalText" value="includeNone" <c:if test="${mailbox.prefs.replyIncludeNone}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="replyIncludeNone"><fmt:message key="optionsIncludeNone"/></label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <app:optSeparator/>
        <tr>
            <td class='ZOptionsTableLabel'>
                <fmt:message key="optionsForward"/> :
            </td>
            <td>
                <fmt:message key="optionsWhenForwarding"/>:
            </td>
        </tr>
        <tr>
            <td class='ZOptionsTableLabel'>
                &nbsp;
            </td>
            <td>
                <table border="0" cellpadding="0" cellspacing="3">
                    <tr>
                        <td>
                            <input id="forwardIncludeBody" type="radio" name="zimbraPrefForwardIncludeOriginalText" value="includeBody" <c:if test="${mailbox.prefs.forwardIncludeBody}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="forwardIncludeBody"><fmt:message key="optionsIncludeBody"/></label>
                        </td>
                        <td>
                            <input id="forwardIncludeBodyWithPrefix" type="radio" name="zimbraPrefForwardIncludeOriginalText" value="includeBodyWithPrefix" <c:if test="${mailbox.prefs.forwardIncludeBodyWithPrefx}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="forwardIncludeBodyWithPrefix"><fmt:message key="optionsIncludeBodyWithPrefix"/></label>
                        </td>
                        <td>
                            <input id="forwardIncludeAsAttachment" type="radio" name="zimbraPrefForwardIncludeOriginalText" value="includeAsAttachment" <c:if test="${mailbox.prefs.forwardIncludeAsAttachment}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="forwardIncludeAsAttachment"><fmt:message key="optionsIncludeAsAttachment"/></label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <app:optSeparator/>
        <tr>
            <td class='ZOptionsTableLabel'>
                <fmt:message key="optionsPrefixChar"/> :
            </td>
            <td>
                <label for="prefixText"><fmt:message key="prefixTextWith"/>:</label>
            </td>
        </tr>
        <tr>
            <td class='ZOptionsTableLabel'>
                &nbsp;
            </td>
            <td>
                <select name="zimbraPrefForwardReplyPrefixChar" id="prefixText">
                    <option
                            <c:if test="${mailbox.prefs.forwardReplyPrefixChar eq '>'}"> selected</c:if> value="&gt;">
                        &gt;
                    </option>
                    <option
                            <c:if test="${mailbox.prefs.forwardReplyPrefixChar eq '|'}"> selected</c:if> value="|">
                        |
                    </option>
                </select>
            </td>
        </tr>
        <app:optSeparator/>
        <tr>
            <td class='ZOptionsTableLabel'>
                <fmt:message key="optionsSentMessages"/> :
            </td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <input id="saveSent" type="radio" name="zimbraPrefSaveToSent" value="TRUE" <c:if test="${mailbox.prefs.saveToSent}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="saveSent"><fmt:message key="optionsSaveSent"/></label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class='ZOptionsTableLabel'>
                &nbsp;
            </td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <input id="dontSave" type="radio" name="zimbraPrefSaveToSent" value="FALSE" <c:if test="${not mailbox.prefs.saveToSent}">checked</c:if>/>
                        </td>
                        <td>
                            <label for="dontSave"><fmt:message key="optionsDontSaveSent"/></label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <app:optSeparator/>
        <tr>
            <td class='ZOptionsTableLabel' colspan=2 style='text-align:left'>
                <fmt:message key="optionsManageAccounts">
                    <fmt:param><fmt:message key="optionsComposeManageAccountsPre"/></fmt:param>
                    <fmt:param><a href="options?selected=accounts"><fmt:message key="optionsManageAccountsLink"/></a></fmt:param>
                    <fmt:param><fmt:message key="optionsManageAccountsPost"/></fmt:param>
                </fmt:message>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
     </table>
</td>
</tr>
</table>