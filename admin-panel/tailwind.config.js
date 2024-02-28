const colors = require('tailwindcss/colors');

module.exports = {
  mode:'jit',
  prefix: '',
  purge: [
      'apps/admin-panel/**/*.{html,ts,css}'
    ],
  darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        primary: colors.blue,
        secondary: colors.orange,
        neutral: colors.gray,
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography')],
};
