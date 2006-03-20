/*
 * ***** BEGIN LICENSE BLOCK *****
 * Version: ZPL 1.1
 * 
 * The contents of this file are subject to the Zimbra Public License
 * Version 1.1 ("License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.zimbra.com/license
 * 
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
 * the License for the specific language governing rights and limitations
 * under the License.
 * 
 * The Original Code is: Zimbra Collaboration Suite Web Client
 * 
 * The Initial Developer of the Original Code is Zimbra, Inc.
 * Portions created by Zimbra are Copyright (C) 2005 Zimbra, Inc.
 * All Rights Reserved.
 * 
 * Contributor(s):
 * 
 * ***** END LICENSE BLOCK *****
 */

function ZmNoteEditView(parent, appCtxt, controller) {
	DwtComposite.call(this, parent, "ZmNoteEditView", DwtControl.ABSOLUTE_STYLE);
	
	this._appCtxt = appCtxt;
	this._controller = controller;
	
	this._createHtml();
}
ZmNoteEditView.prototype = new DwtComposite;
ZmNoteEditView.prototype.constructor = ZmNoteEditView

ZmNoteEditView.prototype.toString =
function() {
	return "ZmNoteView";
};

// Data

ZmNoteEditView.prototype._appCtxt;
ZmNoteEditView.prototype._controller;

// Public methods

ZmNoteEditView.prototype.getController =
function() {
	return this._controller;
};

ZmNoteEditView.prototype.set =
function(note) {
	var callback = new AjxCallback(this, this._setResponse, [note]);
	note.getContent(callback);
};
ZmNoteEditView.prototype._setResponse = function(note) {
	var name = note.name || "";
	this._titleInput.setValue(name);
	this._titleInput.disabled(name != "");

	var content = note.getContent();
	this._textArea.setContent(content);
		
	var focusedComp = name == "" ? this._titleInput : this._textArea;
	focusedComp.focus();
};

ZmNoteEditView.prototype.getTitle =
function() {
	return this._titleInput.getValue();
};
ZmNoteEditView.prototype.getContent =
function() {
	return this._textArea.getContent();
};

ZmNoteEditView.prototype.getSelection =
function() {
	return this._controller.getNote();
};


ZmNoteEditView.prototype.addSelectionListener = function(listener) { /*TODO*/ };
ZmNoteEditView.prototype.addActionListener = function(listener) { /*TODO*/ };

ZmNoteEditView.prototype.setBounds = 
function(x, y, width, height) {
	/***
	// HACK: subtract height/width of scrollbars???
	width -= 11;
	height -= 11;
	/***/
	DwtComposite.prototype.setBounds.call(this, x, y, width, height);

	var textAreaEl = this._textArea.getHtmlElement();
	var loc = Dwt.getPosition(textAreaEl);
	Dwt.setSize("100%", height - loc.y);
};

// Protected methods

ZmNoteEditView.prototype._createHtml =
function() {
	// create components
	this._titleInput = new DwtInputField({parent:this});
	this._titleInput.setRequired(true);
	var titleInputEl = this._titleInput.getInputElement();
	titleInputEl.size = 50;
		
	this._textArea = new ZmNoteEditor(this, null, null, DwtHtmlEditor.HTML, this._appCtxt);
	// HACK: Notes are always HTML format, regardless of the COS setting.
	this._textArea.isHtmlEditingSupported = new Function("return true");
	var textAreaEl = this._textArea.getHtmlElement();
	textAreaEl.style.width = "100%";
	textAreaEl.style.height = "100%";

	// build html
	var table = document.createElement("TABLE");
	table.cellSpacing = 0;
	table.cellPadding = 3;
	table.width = "100%";
	
	var row = table.insertRow(table.rows.length);
	var labelCell = row.insertCell(row.cells.length);
	labelCell.width = "1%";
	labelCell.className = "Label";
	labelCell.innerHTML = ZmMsg.titleLabel;
	var inputCell = row.insertCell(row.cells.length);
	inputCell.appendChild(this._titleInput.getHtmlElement());
	
	var element = this.getHtmlElement();
	element.appendChild(table);
	element.appendChild(textAreaEl);
};

//
// ZmNoteEditor class
//

function ZmNoteEditor(parent, posStyle, content, mode, appCtxt) {
	if (arguments.length == 0) return;
	ZmHtmlEditor.call(this, parent, posStyle, content, mode, appCtxt)
}
ZmNoteEditor.prototype = new ZmHtmlEditor;
ZmNoteEditor.prototype.constructor = ZmNoteEditor;

ZmNoteEditor.prototype.toString = function() {
	return "ZmNoteEditor";
};

// Protected methods

ZmNoteEditor.prototype._getInitialStyle = function(useDiv) {
	return "";
};
