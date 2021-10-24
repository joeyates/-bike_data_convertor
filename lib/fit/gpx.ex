defmodule Fit.Gpx do
  alias Fit.Message.Record

  def save(%Fit{} = fit, filename) do
    records = for %Record{} = m <- fit.messages, do: m

    File.open!(filename, [:write], fn file ->
      IO.write(
        file,
        """
        <?xml version="1.0" encoding="UTF-8"?>
        <gpx xmlns="http://www.topografix.com/GPX/1/1" xmlns:topografix="http://www.topografix.com/GPX/Private/TopoGrafix/0/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:opentracks="http://opentracksapp.com/xmlschemas/v1" xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v2" xmlns:pwr="http://www.garmin.com/xmlschemas/PowerExtension/v1" version="1.1" creator="OpenTracks" xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd http://www.topografix.com/GPX/Private/TopoGrafix/0/1 http://www.topografix.com/GPX/Private/TopoGrafix/0/1/topografix.xsd http://www.garmin.com/xmlschemas/TrackPointExtension/v2 https://www8.garmin.com/xmlschemas/TrackPointExtensionv2.xsd http://www.garmin.com/xmlschemas/PowerExtension/v1 https://www8.garmin.com/xmlschemas/PowerExtensionv1.xsd http://opentracksapp.com/xmlschemas/v1 http://opentracksapp.com/xmlschemas/OpenTracks_v1.xsd">
          <trk>
            <desc><![CDATA[]]></desc>
            <type><![CDATA[cycling]]></type>
            <extensions>
              <topografix:color>c0c0c0</topografix:color>
              <opentracks:trackid>937e4899-0ddf-4c68-a8de-055647d698c6</opentracks:trackid>
            </extensions>
            <trkseg>
        """
      )

      Enum.map(records, fn record ->
        {:ok, trkpt} = Record.to_gpx(record)
        IO.write(file, trkpt)
      end)

      IO.write(
        file,
        """
            </trkseg>
          </trk>
        </gpx>
        """
      )
    end)

    {:ok}
  end
end
