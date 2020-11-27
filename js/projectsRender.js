const $CONTAINER = document.getElementById('ejercicios');
const $API = 'https://renemorgado.herokuapp.com/api';
var projects = [];
var frontend = [];
var backend = [];
var released = [];
var ready = false;

const loadData = () => {
    fetch($API, {
            method: 'GET'
        })
        .then(function(response) {
            return response.text();
        })
        .then(function(data) {
            let e = JSON.parse(data);
            projects = e;
            renderProjects();

        });
}

const renderProjects = () => {
    $CONTAINER.firstElementChild.remove();

    released = projects.filter(f => { return f.cat === "Released" })
    released.forEach(p => {
        $CONTAINER.innerHTML += proyectsLayoutR(p)
    })

    fullstack = projects.filter(f => { return f.cat === "Fullstack" })
    fullstack.forEach(p => {
        $CONTAINER.innerHTML += proyectsLayoutFU(p)
    })

    backend = projects.filter(b => { return b.cat === "Backend" })
    backend.forEach(p => {
        $CONTAINER.innerHTML += proyectsLayoutB(p)
    })

    frontend = projects.filter(f => { return f.cat === "Frontend" })
    frontend.forEach(p => {
        $CONTAINER.innerHTML += proyectsLayoutF(p)
    })
}

loadData();