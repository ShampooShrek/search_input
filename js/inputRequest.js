const input = document.getElementById("inputFoda")
const inputContainer = document.getElementById("inputContainer")
let timeoutId;

input.addEventListener("input", async (e) => {
  const inputList = document.getElementById("inputList");
  const value = e.target.value;

  clearTimeout(timeoutId);

  if (value !== "") {
    timeoutId = setTimeout(async () => {
      const { livros, autores } = await fetchDB(value);
      console.log(`${value}: ${livros}`);

      const div = document.createElement("div");
      div.setAttribute("class", "input_list");
      div.setAttribute("id", "inputList");

      livros.forEach((livro) => {
        const divLivro = document.createElement("div");
        divLivro.setAttribute("class", "livro_content");

        const divImage = document.createElement("div");
        divImage.setAttribute("class", "image_container")
        const livroImage = document.createElement("img");
        livroImage.setAttribute("src", livro.image);
        divImage.appendChild(livroImage);

        const divContent = document.createElement("div");
        divContent.setAttribute("class", "content")
        const livroTitle = document.createElement("h3");
        const pAutor = document.createElement("p");
        livroTitle.innerHTML = livro.title;
        pAutor.innerHTML = `Autor: ${livro.author}`;
        divContent.appendChild(livroTitle);
        divContent.appendChild(pAutor);

        divLivro.appendChild(divImage);
        divLivro.appendChild(divContent);

        div.appendChild(divLivro);
      });

      if (inputList) {
        inputList.remove();
      }

      await new Promise((res) => setTimeout(() => res(), 500))

      inputContainer.appendChild(div);
    
    }, 500);
  } else {    
  if (inputList) {
    inputList.remove();
  }
  }
});

const fetchDB = async (value) => {
  const data = new FormData()
  data.append("value", value)
  
  const response = await fetch("http://localhost/seacrchFoda/getData/", {
    method: "POST",
    body: data,
  })

  const resp = await response.json()

  return resp

}