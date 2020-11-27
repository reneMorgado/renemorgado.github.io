const proyectsLayoutF = (p) => {
    const view = `
        <div class="project-card-container wow animate__fadeInLeft" data-wow-duration="2s" data-wow-iteration="1">
            <div class="card-cate-container card-cate-container-fr">
                <p class="card-cate">
                <i class="fas fa-paint-brush"></i>
                        ${p.cat}
                </p>
            </div>
            <div class="card-draw card-cate-container-fr"></div>
            <div class="card-title-container">
                <p class="card-title">
                    ${p.name}
                </p>
            </div>
            <div class="card-desc-container">
                <p class="card-desc">
                ${p.description}
                </p>
            </div>
            <div class="card-gif-container">
                <img src="https://renemorgado.herokuapp.com${p.gif}" alt="">
            </div>
            <div class="card-git-container">
                <i class="fab fa-github"></i>
                <a href="${p.link} " target="_blank">Ir al código&nbsp;<i class="fas fa-arrow-right"></i></a>
            </div>
            <div class="card-lang-container">
                <p class="card-lang">Escrito con:
                ${p.leng}
                </p>
            </div>
        </div>
    
    `
    return view;
}

const proyectsLayoutFU = (p) => {
    const view = `
        <div class="project-card-container wow animate__fadeInLeft" data-wow-duration="2s" data-wow-iteration="1">
            <div class="card-cate-container card-cate-container-fu">
                <p class="card-cate">
                <i class="fas fa-paint-brush"></i>
                        ${p.cat}
                </p>
            </div>
            <div class="card-draw card-cate-container-fr"></div>
            <div class="card-title-container">
                <p class="card-title">
                    ${p.name}
                </p>
            </div>
            <div class="card-desc-container">
                <p class="card-desc">
                ${p.description}
                </p>
            </div>
            <div class="card-gif-container">
                <img src="https://renemorgado.herokuapp.com${p.gif}" alt="">
            </div>
            <div class="card-git-container">
                <i class="fab fa-github"></i>
                <a href="${p.link} " target="_blank">Ir al código&nbsp;<i class="fas fa-arrow-right"></i></a>
            </div>
            <div class="card-lang-container">
                <p class="card-lang">Escrito con:
                ${p.leng}
                </p>
            </div>
        </div>
    
    `
    return view;
}

const proyectsLayoutR = (p) => {
    const view = `
        <div class="project-card-container wow animate__fadeInLeft" data-wow-duration="2s" data-wow-iteration="1">
            <div class="card-cate-container card-cate-container-re ">
                <p class="card-cate">
                <i class="fas fa-globe-americas"></i>
                        ${p.cat}
                </p>
            </div>
            <div class="card-draw card-cate-container-re"></div>
            <div class="card-title-container">
                <p class="card-title">
                    ${p.name}
                </p>
            </div>
            <div class="card-desc-container">
                <p class="card-desc">
                ${p.description}
                </p>
            </div>
            <div class="card-gif-container">
                <img src="https://renemorgado.herokuapp.com${p.gif}" alt="">
            </div>
            <div class="card-git-container">
            <i class="fas fa-globe-europe"></i>
                <a href="http://${p.link} " target="_blank">Visitar &nbsp;<i class="fas fa-arrow-right"></i></a>
            </div>
            <div class="card-lang-container">
                <p class="card-lang">Escrito con:
                ${p.leng}
                </p>
            </div>
        </div>
    
    `
    return view;
}

const proyectsLayoutB = (p) => {
    const view = `
        <div class="project-card-container wow animate__fadeInLeft" data-wow-duration="2s" data-wow-iteration="1">
            <div class="card-cate-container card-cate-container-ba">
                <p class="card-cate">
                <i class="fas fa-server"></i>
                        ${p.cat}
                </p>
            </div>
            <div class="card-draw card-cate-container-ba"></div>
            <div class="card-title-container">
                <p class="card-title">
                    ${p.name}
                </p>
            </div>
            <div class="card-desc-container">
                <p class="card-desc">
                ${p.description}
                </p>
            </div>
            <div class="card-gif-container">
                <img src="https://renemorgado.herokuapp.com${p.gif}" alt="">
            </div>
            <div class="card-git-container">
            <i class="fab fa-github"></i>
                <a href="${p.link} " target="_blank">Ir al código &nbsp;<i class="fas fa-arrow-right"></i></a>
            </div>
            <div class="card-lang-container">
                <p class="card-lang">Escrito con:
                ${p.leng}
                </p>
            </div>
        </div>
    
    `
    return view;
}