/**
 * 
 */

$(document).ready(function () {
    // Function to load cities based on selected state
    $('#state').change(function () {
        var stateId = $(this).val();

        // Clear city and area dropdowns
        $('#city').empty().append('<option value="">Select City</option>');
        $('#area').empty().append('<option value="">Select Area</option>');

        if (stateId) {
            $.ajax({
                url: '/get-cities',
                type: 'GET',
                data: { stateId: stateId },
                success: function (cities) {
                    $.each(cities, function (i, city) {
                        $('#city').append($('<option>', {
                            value: city.cityId,
                            text: city.cityName
                        }));
                    });

                    // Preselect the city if it's already saved
                    var selectedCity = $('#city').data('selected');
                    if (selectedCity) {
                        $('#city').val(selectedCity).trigger('change');
                    }
                },
                error: function () {
                    console.error('Error fetching cities.');
                }
            });
        }
    });

    // Function to load areas based on selected city
    $('#city').change(function () {
        var cityId = $(this).val();

        // Clear area dropdown
        $('#area').empty().append('<option value="">Select Area</option>');

        if (cityId) {
            $.ajax({
                url: '/get-areas',
                type: 'GET',
                data: { cityId: cityId },
                success: function (areas) {
                    $.each(areas, function (i, area) {
                        $('#area').append($('<option>', {
                            value: area.areaId,
                            text: area.areaName
                        }));
                    });

                    // Preselect the area if it's already saved
                    var selectedArea = $('#area').data('selected');
                    if (selectedArea) {
                        $('#area').val(selectedArea);
                    }
                },
                error: function () {
                    console.error('Error fetching areas.');
                }
            });
        }
    });

    // On page load: Trigger state change to preload cities and areas
    var selectedState = $('#state').val();
    var selectedCity = $('#city').val();
    var selectedArea = $('#area').val();

    // Store pre-selected city and area in data attributes
    $('#city').data('selected', selectedCity);
    $('#area').data('selected', selectedArea);

    // Trigger the state change if a state is selected
    if (selectedState) {
        $('#state').trigger('change');
    }
});
