// Função para buscar os posts do localStorage
function getPosts() {
    const posts = localStorage.getItem("posts");
    return posts ? JSON.parse(posts) : [];
}

// Função para salvar os posts no localStorage
function savePosts(posts) {
    localStorage.setItem("posts", JSON.stringify(posts));
}

// Função para renderizar os posts na página
function renderPosts() {
    const posts = getPosts();
    const postsContainer = document.getElementById("posts");
    postsContainer.innerHTML = "";

    if (posts.length === 0) {
        postsContainer.innerHTML =
            '<p class="text-muted">Nenhum post encontrado.</p>';
    } else {
        posts.forEach((post) => {
            const postLink = document.createElement("a");
            postLink.href = `post-detail.html?id=${post.id}`;
            postLink.className = "list-group-item list-group-item-action";

            // Adiciona o botão "Editar" e "Excluir" ao lado de cada post
            postLink.innerHTML = `
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h5>${post.title}</h5>
                        <p class="mb-0">${post.content.substring(0, 100)}...</p>
                    </div>
                    <div>
                        <a href="edit-post.html?id=${
                            post.id
                        }" class="btn btn-sm btn-outline-secondary">
                            Editar
                        </a>
                        <button class="btn btn-sm btn-outline-danger ms-2" onclick="deletePost(${
                            post.id
                        })">
                            Excluir
                        </button>
                    </div>
                </div>`;

            postsContainer.appendChild(postLink);
        });
    }
}

// Função para excluir um post
function deletePost(postId) {
    const posts = getPosts();
    const updatedPosts = posts.filter((post) => post.id !== postId);
    savePosts(updatedPosts);
}

// Carregar os posts ao carregar a página
document.addEventListener("DOMContentLoaded", renderPosts);
