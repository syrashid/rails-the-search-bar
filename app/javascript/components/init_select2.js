import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    placeholder: 'Select Ingredient',
    width: '100%'
  });
};

export { initSelect2 };
