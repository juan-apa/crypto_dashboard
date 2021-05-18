module ChartHelper
  def diversification_chart_data(data)
    data[:diversification].map { |value| [value[:coin].symbol, value[:percentage]] }
  end

  def diversification_chart_options
    {
      options: {
        scales: {
          xAxes: [{
            display: false,
          }],
          yAxes: [{
            display: false
          }]
        },
        legend: {
          display: false
        },
        tooltips: {
          enabled: false
        },
        cutoutPercentage: 94,
        responsive: true,
        maintainAspectRatio: false
      }
    }
  end
  private

  def build_config(data)
    {
      datasets: build_datasets(data)
    }
  end

  def build_datasets(data)
    [
      {
        data: data.map { |value| value[:percentage] },
        background_color: (1..(data.count)).map{ |_| random_color },
        border_width: 0
      }
    ]
  end

  def random_color
    Random.bytes(3).unpack1('H*')
  end
end
