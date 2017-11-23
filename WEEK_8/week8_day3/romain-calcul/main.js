var box = document.getElementById("result");

function toScreen(i){
  box.value+=i;
  if(i==="C"){
    box.value=' ';
  }
}

function answer(){
  i = box.value;
  i = eval(i);
  box.value = i;
}
