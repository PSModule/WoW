if ([string]::IsNullOrEmpty($ExampleState)) {
    Write-Verbose 'Example not initialized.'
    Write-Verbose 'Initializing now...'
    $ExampleState = 'Initialized'
} else {
    Write-Verbose 'Example already initialized.'
}
