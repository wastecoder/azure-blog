// Função para obter os posts do localStorage
function getPosts() {
    const posts = localStorage.getItem('posts');
    return posts ? JSON.parse(posts) : [];
}

// Função para salvar os posts no localStorage
function savePosts(posts) {
    localStorage.setItem('posts', JSON.stringify(posts));
}

// Adiciona o novo post ao clicar no botão "Salvar Post"
document.getElementById('postForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const title = document.getElementById('title').value;
    const content = document.getElementById('content').value;
    const posts = getPosts();

    // Cria um novo post com um ID único (timestamp)
    const newPost = {
        id: Date.now(),
        title: title,
        content: content
    };

    posts.push(newPost);
    savePosts(posts);

    // Redireciona para a lista de posts
    window.location.href = 'index.html';
});
