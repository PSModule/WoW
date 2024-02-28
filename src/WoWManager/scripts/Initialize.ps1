if ([string]::IsNullOrEmpty($ExampleState)) {
    Write-WoWVerbose 'Example not initialized.'
    Write-WoWVerbose 'Initializing now...'
    $ExampleState = 'Initialized'
} else {
    Write-WoWVerbose 'Example already initialized.'
}
