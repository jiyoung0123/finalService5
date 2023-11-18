let postForm = {
    init: function () {
        $(document).ready(function () {
            $("#submitBtn").click(function () {
                console.log("Button clicked!"); // Log to check if the button click event is firing
                let boardTitle = $("#boardTitle").val();
                let boardContents = $("#boardContents").val();
                let boardImagePath;

                let randomIndex = Math.floor(Math.random() * 5);

                switch (randomIndex) {
                    case 0:
                        boardImagePath = "assets/images/avatars/a.png";
                        break;
                    case 1:
                        boardImagePath = "assets/images/avatars/b.png";
                        break;
                    case 2:
                        boardImagePath = "assets/images/avatars/c.png";
                        break;
                    case 3:
                        boardImagePath = "assets/images/avatars/d.png";
                        break;
                    default:
                        boardImagePath = "assets/images/avatars/e.png";
                }

                postForm.send(boardTitle, boardContents, boardImagePath);
            });
        });
    },
    send: function (boardTitle, boardContents, boardImagePath) {
        console.log("Send function called!");

        let form = document.getElementById('postForm');
        form.method = 'POST';
        form.action = '/boardWriteImpl';

        // Create additional hidden input field for imagePath
        let hiddenImagePath = document.createElement('input');
        hiddenImagePath.type = 'hidden';
        hiddenImagePath.name = 'boardImagePath';
        hiddenImagePath.value = boardImagePath;

        // Remove any existing hidden input fields for imagePath
        let existingHiddenImages = form.querySelectorAll('input[name="boardImagePath"]');
        existingHiddenImages.forEach(function (existingHiddenImage) {
            existingHiddenImage.remove();
        });

        // Append the hidden field to the form
        form.appendChild(hiddenImagePath);

        // Submit the form
        form.submit();
    }
};
