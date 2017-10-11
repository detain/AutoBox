<#
.SYNOPSIS
    Downloads a file from a remote URI.

.DESCRIPTION
    Downloads a file via HTTP or HTTPs to the specified location on the computer. Supports HTTP, HTTPS, and
    HTTPS while ignoring certificate errors for 3rd party verification if you're using self-signed certs.

.PARAMETER url
    The address of the file you wish to download.

.PARAMETER path
    The path on the local computer you want to same the file to.

.PARAMETER IgnoreSSLCertErrors
    Allows you to bypass cert errors when connecting to servers with self-signed certificates.

.EXAMPLE
    Download-File 'http://www.file.com/file.zip' 'c:\users\JourneyOver\Downloads\'
    Download-File 'https://www.secure.com/file.zip' 'c:\users\JourneyOver\Downloads\'
    Download-File 'https://localhost/file.zip' 'c:\users\JourneyOver\Downloads\' -IgnoreSSLCertErrors

.INPUTS

.OUTPUTS

.LINK

    https://github.com/JourneyOver/
#>

function Valid-UrlFormat {
  param(
    [System.Uri]$url
  )
  return ($url.AbsoluteURI -ne $null -and $url.Scheme -match '[http|https]');
}

function Download-File {

  # Usage: Download-File -url 'https://chocolateypackages.s3.amazonaws.com/borderlessgaming.8.2.nupkg' -path 'D:\SkyDrive\Scripts' -IgnoreSSLCertErrors

  param(
    [System.Uri]$url,
    [string]$path,
    [switch]$IgnoreSSLCertErrors
  )

  # Validate the URL, if it's not a proper URL, throw an Error
  if (-not (Valid-UrlFormat($url))) {
    Write-Error "$url is not a valid URL.";
    return;
  }

  $numSegments = ([System.Uri]$url).Segments.Length;
  $filename = ([System.Uri]$url).Segments[$numSegments - 1];

  # Validate the path, if it doesn't exist, create it.
  if (Test-Path $path) {
    if (-not ($path.EndsWith('\'))) {
      $path = $path + '\' + $filename;
    }
    else {
      $path = $path + $filename;
    }
  }
  else {
    Write-Warning "$path did not exist, so we created it for you."
    mkdir $path;
    if (-not ($path.EndsWith('\'))) {
      $path = $path + '\' + $filename;
    }
    else {
      $path = $path + $filename;
    }
  }

  # Try to download the data at the given URL
  $client = new-object System.Net.WebClient;
  if ($url.Scheme -eq 'https') {
    if ($IgnoreSSLCertErrors) {
      [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true};
    }
    $client.Headers.Add("Accept-Language", "en-us,en;q=0.5");
    $client.Headers.Add("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4");
  }

  $client.DownloadFile( $url, $path );
}
