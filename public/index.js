let especialidad = document.getElementById('especialidad')
especialidad.addEventListener('change',mostrarMedicos);
var tabla_medicos = document.getElementById('medicos')
function mostrarMedicos(){
    let id = especialidad.value
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {

        if (this.readyState == 4 && this.status == 200) {
            var medicos = JSON.parse(this.response);
            for(let i=0;i<medicos.length;i=i+2){
               var tr = document.createElement('tr');
                for(let y=i;y<medicos.length;y++){
                var td = document.createElement('td');
                var input = document.createElement('input');
                input.setAttribute('type','checkbox')
                input.setAttribute('name','medicos[]')
                input.setAttribute('value',medicos[i]['especialidad'])
                //var texto = document.createTextNode(medicos[i]['nombre']);
                td.appendChild(input)
                //td.appendChild(texto)
                tr.appendChild(td)
                }
                tabla_medicos.appendChild(tr);
            }
        }
    };
    xhttp.open("GET", "lista_medicos.php?especialidad=" . id, true);
    xhttp.send();
    // para que no se siga el link que llama a esta función
    return false;
}