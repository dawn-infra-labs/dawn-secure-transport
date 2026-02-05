name: Module Update Request
description: Request updates to module specifications or documentation
labels: [documentation]
body:
  - type: dropdown
    id: module
    attributes:
      label: Module
      options:
        - core
        - transport
        - discovery
        - routing
        - other
    validations:
      required: true

  - type: textarea
    id: change
    attributes:
      label: Requested Change
      description: Describe what needs to be updated.
    validations:
      required: true

  - type: textarea
    id: reason
    attributes:
      label: Reason
      description: Why should this change be made?
    validations:
      required: true
