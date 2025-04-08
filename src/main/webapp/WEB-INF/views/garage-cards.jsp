<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
    <c:forEach var="g" items="${allGarages}">
        <div class="col">
            <div class="garage-card shadow">
                <img src="${g.imagePicPath}" alt="${g.garageTitle}" class="garage-img">
                <div class="card-body">
                    <h4 class="garage-title">${g.garageTitle}</h4>
                    <div class="garage-info">
                        <p><strong>Since:</strong> ${g.experienceYear}</p>
                        <p><strong>Speciality:</strong> ${g.speciality}</p>
                        <p><strong>Contact:</strong> ${g.contactNo}</p>
                        <p><strong>Address:</strong> ${g.address}</p>
                        <p><strong>State:</strong> ${g.stateName}</p>
                        <p><strong>City:</strong> ${g.cityName}</p>
                        <p><strong>Area:</strong> ${g.areaName}</p>
                    </div>
                    <a href="viewgarage?id=${g.serviceProviderId}" class="btn btn-book w-100">View Garage</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>