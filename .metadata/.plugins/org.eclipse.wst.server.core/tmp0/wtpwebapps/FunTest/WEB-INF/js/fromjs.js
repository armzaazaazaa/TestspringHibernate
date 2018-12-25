

function myFunction(id,email,pass) {

	// alter('55555');
	console.log(id);
	console.log(email);
	console.log(pass);

	  $('#emailedit').val(email);
      $('#passwordedit').val(pass);
      $('#idfrom').val(id);
	 $('#exampleModaledit').modal('show')

}

function del(id) {
	
	//alter('11111');
	console.log(id);
	 $('#idfromdel').val(id);
	 $('#exampleModaldel').modal('show')
	 

}


