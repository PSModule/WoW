if ([string]::IsNullOrEmpty($ExampleState)) {
    Write-Host 'Example not initialized.'
    Write-Host 'Initializing now...'
    $ExampleState = 'Initialized'
} else {
    Write-Host 'Example already initialized.'
}
