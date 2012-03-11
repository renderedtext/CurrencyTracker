var SimpleLineChart = {};

SimpleLineChart.initialize = function(root_element) { return new ViewController(root_element, {
  initialize: function() {
    this.sets = {};
    this.width  = parseInt( this.root.getAttribute('width') );
    this.height = parseInt( this.root.getAttribute('height') );

    var sets = $(this.root).find('tr');
    for( var i = 0; i < sets.length; i++ ) {
      var set_name = $(sets[i]).find('th').html();
      var set_value = parseInt( $(sets[i]).find('td').html() );
      this.sets[set_name] = set_value;
    }

    this.render();
  },

  render: function() {
    $(this.root).html('');

    var img = document.createElement('img');
    img.setAttribute('width', this.width);
    img.setAttribute('height', this.height);
    img.setAttribute('src', this.image_url());

    this.root.appendChild(img);
  },  

  image_url: function() {
    var url = "http://chart.googleapis.com/chart?"
	url += "chxl=0:|" + this.labels().join('|');
    url += "&chxt=x"
	url += "&cht=lc"
	url += "&chds=0,15,-5,15"
	url += "&chm=o,FF9900,1,-2,8|b,3399CC44,0,1,0"
    url += "&chs=" + this.width + 'x' + this.height
    url += "&chd=t:0,0|" + this.values().join(',');
    return url;
  },

  values: function() {
    var result = new Array();
    for( var set_name in this.sets )
      result[result.length] = this.sets[set_name];
    return result;
  },

  labels: function() {
    var result = new Array();
    for( var set_name in this.sets )
      result[result.length] = set_name;
    return result;
  },

  raw_total: function() {
    var total = 0;

    for( set_name in this.sets ) 
      total += this.sets[set_name];
    
    return total;
  },

  percent_for_set: function(set_name) {
    var raw_value = this.sets[set_name];

    return raw_value / this.raw_total();
  }
})};

$(document).ready(function() {
  $('.simple_line_chart').each(function() {
    $(this).data('line_chart' ,SimpleLineChart.initialize(this));
  });
})
