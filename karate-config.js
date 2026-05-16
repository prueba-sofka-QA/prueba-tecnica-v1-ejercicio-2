function fn() {
  var env = karate.env || 'test';
  var config = {
    baseUrl: 'https://api.demoblaze.com'
  };
  return config;
}
