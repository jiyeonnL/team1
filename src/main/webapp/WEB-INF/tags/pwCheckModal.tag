<%@ tag language="java" pageEncoding="EUC-KR"%>


<style>

#modal-find-button {
  	background-color: #264d73;
   	color: white;
	font-size: x-large;
}

#modal-find-goto-login {
    background-color: #264d73;
    color: white;
    font-size: x-large;
}

</style>

    <div id="pwModal" class="modal fade " tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content back-ground">

                <div class="modal-header header-color">
                    <h5 class="modal-title" id="exampleModalLabel">��й�ȣ ã��</h5>
                    <button type="button" id="pwModal-close" class="btn-close" data-bs-dismiss="modal">X</button>
                </div>
                <div class="modal-body" id="modal-body">

                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">���� �� �Է��� �̸���</label>
                        <input type="text" class="form-control" id="modal-check-email">
                    </div>
                    <div id="result"></div>
                </div>
                <div class="modal-footer modal-end">
                	<button id="modal-find-goto-login" class="btn float-end">�ڷ�</button>
                    <button id="modal-find-button" class="btn float-end">ã��</button>
                </div>
            </div>
        </div>
    </div>
    <script>
    
    	function clearModal() {
    		
    		$("#modal-check-email").val("");
    		$("#result").empty();
			
		}
    
    	const appRoot = '${pageContext.request.contextPath}';	
    
        $("#pwModal-close").click(function () {
        	clearModal();
        	$("#pwModal").modal("hide");
            
        });

        $("#modal-find-goto-login").click(function () {
        	 clearModal();
        	$("#pwModal").modal("hide");   
            //login �������� �ƴ� ��쿡�� �α��� ����� �ٽ� ����.
            if(window.location.pathname == '${pageContext.request.contextPath }/user/login') {
            } else {
            	$('#myModal').modal('show');
            }
        });
        
        $("#modal-find-button").click(function () {
            //��ư �Է� ���´�
            $("#modal-find-button").attr('disabled', true);

            //�ε�â ����.
            $("#result").append(`
            <div class="d-flex justify-content-center">
                <div class="spinner-border" role="status">
                    <span class="sr-only">Loading...</span>
                 </div>
            </div>`
            );

            let emailVal = $('#modal-check-email').val();
            $.ajax({
                type: 'post', //post ������� ����
                url: appRoot + "/user/pwFind", //�����͸� �ְ���� ���� �ּ�
                timeout: 10000,
                data: {
                    email: emailVal
                },
                success: function (data) { //���� �ְ�ޱⰡ �������� ���. data ���� �ȿ� ���� ��ƿ´�.

                    if (data == "success") {
                        $("#result").text("������ �߼۵Ǿ����ϴ�.")
                    } else if (data == "fail") {
                        $("#result").text("�������� �ʴ� �̸����Դϴ�!")
                    } else if (data == "error") {
                        $("#result").text("������ �߻��߽��ϴ�.")
                    } else {
                        $("#result").text("������ �߻��߽��ϴ�.")
                    }
                },
                error: function (error) {
                    $("#result").text("������ �߻��߽��ϴ�.")
                },

                complete: function () {
                    $("#modal-find-button").attr('disabled', false);
                }
            });


        })
    </script>