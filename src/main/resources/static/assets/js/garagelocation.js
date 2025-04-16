/**
 * 
 */

$(document).ready(function () {
       $('#state').on('change', function () {
           let stateId = $(this).val();
           $('#city').html('<option value="" disabled selected>Loading...</option>');
           $('#area').html('<option value="" disabled selected>Select Area</option>');

           $.get('/get-cities', { stateId: stateId }, function (cities) {
               let cityOptions = '<option value="" disabled selected>Select City</option>';
               $.each(cities, function (index, city) {
                   cityOptions += '<option value="' + city.cityId + '">' + city.cityName + '</option>';
               });
               $('#city').html(cityOptions);
           });
       });

       $('#city').on('change', function () {
           let cityId = $(this).val();
           $('#area').html('<option value="" disabled selected>Loading...</option>');

           $.get('/get-areas', { cityId: cityId }, function (areas) {
               let areaOptions = '<option value="" disabled selected>Select Area</option>';
               $.each(areas, function (index, area) {
                   areaOptions += '<option value="' + area.areaId + '">' + area.areaName + '</option>';
               });
               $('#area').html(areaOptions);
           });
       });
   });