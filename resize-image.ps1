<#
.SYNOPSIS
   Resize an image
.DESCRIPTION
   Resize an image based on a new given height or width or a single dimension and a maintain ratio flag. 
   The execution of this CmdLet creates a new file named "OriginalName_resized" and maintains the original
   file extension
.PARAMETER Width
   The new width of the image. Can be given alone with the MaintainRatio flag
.PARAMETER Height
   The new height of the image. Can be given alone with the MaintainRatio flag
.PARAMETER ImagePath
   The path to the image being resized
.PARAMETER MaintainRatio
   Maintain the ratio of the image by setting either width or height. Setting both width and height and also this parameter
   results in an error
.PARAMETER Percentage
   Resize the image *to* the size given in this parameter. It's imperative to know that this does not resize by the percentage but to the percentage of
   the image. 
.EXAMPLE
   Resize-Image -Height 45 -Width 45 -ImagePath "Path/to/image.jpg"
.EXAMPLE
   Resize-Image -Height 45 -MaintainRatio -ImagePath "Path/to/image.jpg"
.EXAMPLE
   #Resize to 50% of the given image
   Resize-Image -Percentage 50 -ImagePath "Path/to/image.jpg"
.NOTES
   Written By: 
   Christopher Walker
#>
Function Resize-Image() {
    [CmdLetBinding(
        SupportsShouldProcess=$true, 
        PositionalBinding=$false,
        ConfirmImpact="Medium",
        DefaultParameterSetName="Absolute"
    )]
    Param (
        [Parameter(Mandatory=$True)]
        [ValidateScript({
            $_ | ForEach-Object {
                Test-Path $_
            }
        })][String[]]$ImagePath,
        [Parameter(Mandatory=$False)][Switch]$MaintainRatio,
        [Parameter(Mandatory=$False, ParameterSetName="Absolute")][Int]$Height,
        [Parameter(Mandatory=$False, ParameterSetName="Absolute")][Int]$Width,
        [Parameter(Mandatory=$False, ParameterSetName="Percent")][Double]$Percentage
    )
    Begin {
        If ($Width -and $Height -and $MaintainRatio) {
            Throw "Absolute Width and Height cannot be given with the MaintainRatio parameter."
        }

        If (($Width -xor $Height) -and (-not $MaintainRatio)) {
            Throw "MaintainRatio must be set with incomplete size parameters (Missing height or width without MaintainRatio)"
        }

        If ($Percentage -and $MaintainRatio) {
            Write-Warning "The MaintainRatio flag while using the Percentage parameter does nothing"
        }
		# loading - hopefully the right directory for System.Drawing.Bitmap
        # Balazs
		Add-Type -Assembly System.Windows.Forms
        # getting all the elements in the folder provided by the user
        # otherwise the script block wouldn't work below
        # Balazs
        Write-Verbose "Imagepath Variable Begin:"
        Write-Verbose $ImagePath
        $Images = Get-ChildItem $ImagePath
    }
    Process {
            # ?!?!?!?!?!?!?!
            # why does $ImagePath variable disappear?!?!
            Write-Verbose "Imagepath Variable Process:"
            Write-Verbose $ImagePath

        ForEach ($Image in $Images) {
            # Write-Verbose for testing purposes - Balazs
            Write-Verbose "Image:"
            Write-Verbose $Image
            
            # correcting this part
            # sadly we won't get the images if we keep the path as it is
            # so we also cannot use this otherwise clever command
            # Balazs
            # $Path = (Resolve-Path $Image).Path
            
            $Path = $ImagePath + $Image
            Write-Verbose "Path to image:"
            Write-Verbose $Path

            Write-Verbose "Path:"
            Write-Verbose $Path
            $Dot = $Path.LastIndexOf(".")
            Write-Verbose "Dot:"
            Write-Verbose $Dot
            #Add name modifier (OriginalName_resized.jpg)
            $OutputPath = $Path.Substring(0,$Dot) + "_resized" + $Path.Substring($Dot,$Path.Length - $Dot)
            $OldImage = New-Object -TypeName System.Drawing.Bitmap -ArgumentList $Path
            $OldHeight = $OldImage.Height
            $OldWidth = $OldImage.Width

            If ($MaintainRatio) {
                $OldHeight = $OldImage.Height
                $OldWidth = $OldImage.Width
                If ($Height) {
                    $Width = $OldWidth / $OldHeight * $Height
                }
                If ($Width) {
                    $Height = $OldHeight / $OldWidth * $Width
                }
            }

            If ($Percentage) {
                $Percentage = ($Percentage / 100)
                $Height = $OldHeight * $Percentage
                $Width = $OldWidth * $Percentage
            }

            $Bitmap = New-Object -TypeName System.Drawing.Bitmap -ArgumentList $Width, $Height
            $NewImage = [System.Drawing.Graphics]::FromImage($Bitmap)
            
            #Retrieving the best quality possible
            $NewImage.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
            $NewImage.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
            $NewImage.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
            
            $NewImage.DrawImage($OldImage, $(New-Object -TypeName System.Drawing.Rectangle -ArgumentList 0, 0, $Width, $Height))
            If ($PSCmdlet.ShouldProcess("Resized image based on $Path", "saved to $OutputPath")) {
                $Bitmap.Save($OutputPath)
            }
            $Bitmap.Dispose()
            $NewImage.Dispose()
        }
    }
}