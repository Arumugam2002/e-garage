/**
 * 
 */


    $(document).ready(function () {

		
		
		
		function loadAllGarages() {
		           $.ajax({
		               url: '/getAllGarages',
		               type: 'GET',
		               success: function (garages) {
		                   renderGarageCards(garages);
		               },
		               error: function () {
		                   alert('Failed to load garages.');
		               }
		           });
		       }

		       // 🔹 Render Garage Cards
		       function renderGarageCards(garages) {
		           $('#garageContainer .row').empty();
		           if (garages.length > 0) {
		               $.each(garages, function (i, garage) {
		                   const garageCard = `
		                   <div class="col">
		                       <div class="garage-card shadow">
		                           <img src="${garage.imagePicPath}" alt="${garage.garageTitle}" class="garage-img">
		                           <div class="card-body">
		                               <h4 class="garage-title">${garage.garageTitle}</h4>
		                               <div class="garage-info">
		                                   <p><strong>Since:</strong> ${garage.experienceYear}</p>
		                                   <p><strong>Speciality:</strong> ${garage.speciality}</p>
		                                   <p><strong>Contact:</strong> ${garage.contactNo}</p>
		                                   <p><strong>Address:</strong> ${garage.address}</p>
		                                   <p><strong>State:</strong> ${garage.stateName}</p>
		                                   <p><strong>City:</strong> ${garage.cityName}</p>
		                                   <p><strong>Area:</strong> ${garage.areaName}</p>
		                               </div>
		                               <a href="viewgarage?id=${garage.serviceProviderId}" class="btn btn-book w-100">View Garage</a>
		                           </div>
		                       </div>
		                   </div>`;
		                   $('#garageContainer .row').append(garageCard);
		               });
		           } else {
		               $('#garageContainer .row').append('<div class="col-12 text-center">No garages available.</div>');
		           }
		       }

		       // 🔹 Load all garages on page load
		       loadAllGarages();

		
		
		
        // State change
        $('#stateDropdown').change(function () {
            const stateId = $(this).val();
            $('#cityDropdown').empty().append('<option value="">-- Select City --</option>').prop('disabled', true);
            $('#areaDropdown').empty().append('<option value="">-- Select Area --</option>').prop('disabled', true);
				console.log("before call")
            if (stateId) {
                $.ajax({
                    url: '/getCities',
                    type: 'GET',
                    data: { stateId: stateId },
                    success: function (cities) {
                    	console.log(cities)
                        $('#cityDropdown').prop('disabled', false);
                        $.each(cities, function (i, city) {
                        	
                        	console.log(city.cityId);
                        	const cname = '<option value=  "' + city.cityId + '">' +  city.cityName + ' </option>';
                        	console.log(cname);
                            $('#cityDropdown').append(cname);
                        });
                    }
                });
            }
        });

        // City change
        $('#cityDropdown').change(function () {
            const cityId = $(this).val();
            $('#areaDropdown').empty().append('<option value="">-- Select Area --</option>').prop('disabled', true);

            if (cityId) {
                $.ajax({
                    url: '/getAreas',
                    type: 'GET',
                    data: { cityId: cityId },
                    success: function (areas) {
                        $('#areaDropdown').prop('disabled', false);
                        $.each(areas, function (i, area) {
                        	
                        	const carea = '<option value= "' + area.areaId + '">' + area.areaName + '</option>';
                        	console.log(carea);
                            $('#areaDropdown').append(carea);
                        });
                    }
                });
            }
        });

        // Area change → Load garages
        $('#areaDropdown').change(function () {
            const stateId = $('#stateDropdown').val();
            const cityId = $('#cityDropdown').val();
            const areaId = $(this).val();

            $.ajax({
                url: '/filterGarages',
                type: 'GET',
                data: {
                    stateId: stateId,
                    cityId: cityId,
                    areaId: areaId
                },
                
                success: function (garages) {
                    $('#garageContainer .row').empty();
                    console.log(garages);
                    if(garages.length>0)
						{
                    	 $.each(garages, function (i, garage) {
                             const garageCard = `
                            	 <div class="col">
                                 <div class="garage-card shadow">
                                 <img src="` + garage.imagePicPath + `" alt="` + garage.garageTitle + `" class="garage-img">
                                     <div class="card-body">
                                         <h4 class="garage-title">${garage.garageTitle}</h4>
                                         <div class="garage-info">
                                         <p><strong>Since:</strong> ` + garage.experienceYear + `</p>
                                         <p><strong>Speciality:</strong> ` + garage.speciality + `</p>
                                         <p><strong>Contact:</strong> ` + garage.contactNo + `</p>
                                         <p><strong>Address:</strong> ` + garage.address + `</p>
                                         <p><strong>State:</strong> ` + garage.stateName + `</p>
                                         <p><strong>City:</strong> ` + garage.cityName + `</p>
                                         <p><strong>Area:</strong> ` + garage.areaName + `</p>
                                         </div>
                                         <a href="viewgarage?id=` + garage.serviceProviderId + `" class="btn btn-book w-100">View Garage</a>
                                     </div>
                                 </div>
                             </div>`;
                             $('#garageContainer .row').append(garageCard);
                         });
                    	
                    	
                    	}else{
                    		$('#garageContainer .row').append('<div class="col-12 text-center">No garages found for the selected area.</div>');
                    	}
                },error: function()
                {
                	 alert('Failed to retrieve garages.');
                }
                    
                
            });
        });
    });
