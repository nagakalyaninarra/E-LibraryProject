<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Adding Book</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <style>
    .heading {
      text-align: center;
      font-size: 1.5rem;
      margin-bottom: 1rem;
    }
    .generated-ids {
      margin-top: 1rem;
    }
  </style>
</head>
<body>
  <section class="vh-100">
    <div class="container mt-4">
      <div class="card col-md-5 mx-auto shadow-lg border border-info">
        <div class="card-body">
          <form action="./AddBooksServlet" method="post" onsubmit="return prepareFormSubmission()">
            <p class="heading">Adding Books</p>
            <div class="form-group">
              <label for="Count">Count</label>
              <input type="number" id="Count" name="Count" class="form-control" placeholder="Enter Count" required min="1" />
            </div>
            <div class="form-group">
              <label for="TitleId">Title Id</label>
              <input type="text" id="TitleId" name="TitleId" class="form-control" placeholder="Enter Title Id" required />
            </div>
            <div class="form-group">
              <label for="TitleName">Title Name</label>
              <input type="text" id="TitleName" name="TitleName" class="form-control" placeholder="Enter Title Name" required />
            </div>
            <div class="form-group">
              <label for="AllowLend">Allow Lend</label>
              <input type="text" id="AllowLend" name="AllowLend" class="form-control" placeholder="Enter Allow Lend" required />
            </div>
            <div class="form-group">
              <label for="AuthorName">Author Name</label>
              <input type="text" id="AuthorName" name="AuthorName" class="form-control" placeholder="Enter Author Name" required />
            </div>
            <div class="form-group">
              <label for="AuthorId">Author Id</label>
              <input type="text" id="AuthorId" name="AuthorId" class="form-control" placeholder="Enter Author Id" required />
            </div>
            <div class="form-group">
              <label for="SupplierName">Supplier Name</label>
              <input type="text" id="SupplierName" name="SupplierName" class="form-control" placeholder="Enter Supplier Name" required />
            </div>
            <div class="form-group">
              <label for="BillNo">Bill No</label>
              <input type="text" id="BillNo" name="BillNo" class="form-control" placeholder="Enter Bill No" required />
            </div>
            <div class="form-group">
              <label for="GeneratedIds">Generated Accession Numbers</label>
              <div id="GeneratedIds" class="generated-ids"></div>
              <input type="hidden" id="AccessionNumbers" name="AccessionNumbers">
            </div>
            <div class="d-flex justify-content-center mt-4 pt-2">
              <button type="submit" class="btn btn-primary btn-lg">Submit</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

  <script>
    var AccessionNumber = localStorage.getItem('lastAccessionNumber') ? parseInt(localStorage.getItem('lastAccessionNumber')) : 66000;

    function prepareFormSubmission() {
        var count = parseInt(document.getElementById("Count").value);
        var generatedIdsDiv = document.getElementById("GeneratedIds");
        generatedIdsDiv.innerHTML = '';

        var accessionNumbers = [];
        for (var i = 0; i < count; i++) {
            accessionNumbers.push(AccessionNumber);
            var p = document.createElement('p');
            p.textContent = "Accession Number " + (i + 1) + ": " + AccessionNumber;
            generatedIdsDiv.appendChild(p);
            AccessionNumber++;
        }

        document.getElementById("AccessionNumbers").value = accessionNumbers.join(",");
        localStorage.setItem('lastAccessionNumber', AccessionNumber);

        return true;
    }
  </script>
</body>
</html>
