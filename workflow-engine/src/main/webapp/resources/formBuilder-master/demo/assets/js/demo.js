jQuery(function($) {
	var SERVLET_CONTEXT = 'http://localhost:8080/workflow-engine';
	
  var fields = [
    {
      type: 'autocomplete',
      label: 'Custom Autocomplete',
      required: true,
      values: [
        {label: 'SQL'},
        {label: 'C#'},
        {label: 'JavaScript'},
        {label: 'Java'},
        {label: 'Python'},
        {label: 'C++'},
        {label: 'PHP'},
        {label: 'Swift'},
        {label: 'Ruby'}
      ]
    },
    {
      label: 'Star Rating',
      attrs: {
        type: 'starRating'
      },
      icon: '🌟'
    }
  ];

  var actionButtons = [{
    id: 'smile',
    className: 'btn btn-success',
    label: '😁',
    type: 'button',
    events: {
      click: function() {
        alert('😁😁😁 !SMILE! 😁😁😁');
      }
    }
  }];

  var templates = {
    starRating: function(fieldData) {
      return {
        field: '<span id="'+fieldData.name+'">',
        onRender: function() {
          $(document.getElementById(fieldData.name)).rateYo({rating: 3.6});
        }
      };
    }
  };

  var inputSets = [{
        label: 'User Details',
        name: 'user-details', // optional
        showHeader: true, // optional
        fields: [{
          type: 'text',
          label: 'First Name',
          className: 'form-control'
        }, {
          type: 'select',
          label: 'Profession',
          className: 'form-control',
          values: [{
            label: 'Street Sweeper',
            value: 'option-2',
            selected: false
          }, {
            label: 'Brain Surgeon',
            value: 'option-3',
            selected: false
          }]
        }, {
          type: 'textarea',
          label: 'Short Bio:',
          className: 'form-control'
        }]
      }, {
        label: 'User Agreement',
        fields: [{
          type: 'header',
          subtype: 'h3',
          label: 'Terms & Conditions',
          className: 'header'
        }, {
          type: 'paragraph',
          label: 'Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.',
        }, {
          type: 'paragraph',
          label: 'Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.',
        }, {
          type: 'checkbox',
          label: 'Do you agree to the terms and conditions?',
        }]
      }];

  var typeUserDisabledAttrs = {
    autocomplete: ['access']
  };

  var typeUserAttrs = {
    text: {
      className: {
        label: 'Class',
        options: {
          'red form-control': 'Red',
          'green form-control': 'Green',
          'blue form-control': 'Blue'
        },
        style: 'border: 1px solid red'
      }
    }
  };

  // test disabledAttrs
  var disabledAttrs = ['placeholder'];

  var fbOptions = {
    subtypes: {
      text: ['datetime-local']
    },
    onSave: function(e, formData) {
      toggleEdit();
      $('.render-wrap').formRender({
        formData: formData,
        templates: templates
      });
      window.sessionStorage.setItem('formData', JSON.stringify(formData));
    },
    stickyControls: {
      enable: true
    },
    sortableControls: true,
    fields: fields,
    templates: templates,
    inputSets: inputSets,
    typeUserDisabledAttrs: typeUserDisabledAttrs,
    typeUserAttrs: typeUserAttrs,
    disableInjectedStyle: false,
   /* actionButtons: actionButtons,*/
    disableFields: ['autocomplete']
    // controlPosition: 'left'
    // disabledAttrs
  };
  var formData = window.sessionStorage.getItem('formData');
  var editing = true;

  if (formData) {
    fbOptions.formData = JSON.parse(formData);
  }

  /**
   * Toggles the edit mode for the demo
   * @return {Boolean} editMode
   */
  function toggleEdit() {
    document.body.classList.toggle('form-rendered', editing);
    return editing = !editing;
  }

  var setFormData = '[{"name":"date-1501004302939","label":"Posting Date","required":"true","type":"date","value":null,"subtype":null,"fieldId":"field14","userFromId":null,"jsonData":null,"values":null,"class":null},{"name":"text-1501004346172","label":"period","required":"true","type":"text","value":null,"subtype":"text","fieldId":"field15","userFromId":null,"jsonData":null,"values":null,"class":null},{"name":"select-1501004387965","label":"Doc Type","required":"true","type":"select","value":null,"subtype":null,"fieldId":"field16","userFromId":null,"jsonData":null,"values":[{"value":"SA","label":"SA - G/L Account Document"},{"value":"ZJ","label":"ZJ - Non-Cost Transfer"},{"value":"ZK","label":"ZK - Cost Transfer"},{"value":"ZV","label":"ZV - Cost Transfer Over 90 Days"}],"class":null},{"name":"select-1501004741318","label":"Referances","required":"true","type":"select","value":null,"subtype":null,"fieldId":"field17","userFromId":null,"jsonData":null,"values":[{"value":"Select","label":"Select"},{"value":"G/L Adjustment","label":"G/L Adjustment"}],"class":null},{"name":"text-1501004836404","label":"Company Code","required":"true","type":"text","value":null,"subtype":"text","fieldId":"field18","userFromId":null,"jsonData":null,"values":null,"class":null},{"name":"text-1501004838844","label":"Document Header","required":"true","type":"text","value":null,"subtype":"text","fieldId":"field19","userFromId":null,"jsonData":null,"values":null,"class":null},{"name":"text-1501004895256","label":"Debit Amount","required":"true","type":"text","value":null,"subtype":"text","fieldId":"field20","userFromId":null,"jsonData":null,"values":null,"class":null},{"name":"text-1501004896976","label":"Credit Amount","required":"true","type":"text","value":null,"subtype":"text","fieldId":"field21","userFromId":null,"jsonData":null,"values":null,"class":null},{"name":"text-1501004945288","label":"Author","required":"true","type":"text","value":null,"subtype":"text","fieldId":"field22","userFromId":null,"jsonData":null,"values":null,"class":null},{"name":"file-1501004973224","label":"Upload Evidence","required":"true","type":"file","value":null,"subtype":"file","fieldId":"field23","userFromId":null,"jsonData":null,"values":null,"class":null}]';
  var formBuilder = $('.build-wrap').formBuilder(fbOptions);
  var fbPromise = formBuilder.promise;

  fbPromise.then(function(fb) {
    var apiBtns = {
      showData: fb.actions.showData,
      clearFields: fb.actions.clearFields,
      getData: function() {
        console.log(fb.actions.getData());
      },
      setData: function() {
        fb.actions.setData(setFormData);
      },
      addField: function() {
        var field = {
            type: 'text',
            class: 'form-control',
            label: 'Text Field added at: ' + new Date().getTime()
          };
        fb.actions.addField(field);
      },
      removeField: function() {
        fb.actions.removeField();
      },
      testSubmit: function() {
        var formData = new FormData(document.forms[0]);
        console.log(formData);
        console.log('Can submit: ', document.forms[0].checkValidity());
        // Display the key/value pairs
       /* console.log('FormData: ', );
        for(var pair of formData.entries()) {
           console.log(pair[0]+ ': '+ pair[1]);
        }*/
        alert(alert(SERVLET_CONTEXT));
        $.ajax({
	        url: SERVLET_CONTEXT + '/forms/saveJsonFormMetaData?processId=1',
	        type: "POST",
	        dataType: 'json',
	        data: formBuilder.actions.getData('json'),
	        contentType: 'application/json',
	        success: function (resposeResult) {
	            if (!resposeResult.success) {
	                alert("There was an error while saving process:::"+resposeResult.message);
	            }
	            else {
	            	$('#dialog').css('display', 'block');
	                $("#dialog").text('Entry has been added successfully');
	                $("#dialog").dialog({
	                    title: 'Success',
	                    modal: true,
	                    buttons: {
	                        "Ok": function() {
	                        	//grid.trigger('reloadGrid');
	                        	
	                            $(this).dialog("close");
	                            $('#dialog').css('display', 'none');
	                        }
	                    }
	                });
	            	console.log(allRowsInGrid);
	            }
	        },
	        error: function (error) {
	            alert("There was system error");
	        }
	    });
      },
      resetDemo: function() {
        window.sessionStorage.removeItem('formData');
        location.reload();
      }
    };

    Object.keys(apiBtns).forEach(function(action) {
      document.getElementById(action)
      .addEventListener('click', function(e) {
        apiBtns[action]();
      });
    });
    document.getElementById('getXML').addEventListener('click', function() {
    	console.log(formBuilder.actions.getData('xml'));
      alert(formBuilder.actions.getData('xml'));
    });
    document.getElementById('getJSON').addEventListener('click', function() {
    	console.log(formBuilder.actions.getData('json'));
      alert(formBuilder.actions.getData('json', true));
    });
    document.getElementById('getJS').addEventListener('click', function() {
      alert('check console');
      console.log(formBuilder.actions.getData());
    });
  });

  document.getElementById('edit-form').onclick = function() {
    toggleEdit();
  };
});
