$(function() {
	//提交按钮保存事件
	$('#savePwd').click(function(e) {
		savePassWord();
	});

});

function savePassWord(){
	var oldPwd = $('#oldPwd').val();
	var newPwd = $('#newPwd').val();
	var newPwdAgain = $('#newPwdAgain').val();
	
	$.ajax({
        type: "POST",
        url:'changePassword.pfv',
        data:{
        	oldPwd:oldPwd,
        	newPwd:newPwd,
        	newPwdAgain:newPwdAgain
    		    	
    	},
    	dataType:'text',
        success: function(result) {
        	alertMessage("温馨提示",result);
        }
    });

}
