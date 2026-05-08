# System Architecture Diagram

This diagram illustrates the high-level flow of data and interactions between the core applications, based on the `application_inventory.csv` and assumed data flows.

## Mermaid Diagram Code

```mermaid
graph TD
    subgraph Users
        C[Customers]
    end

    subgraph Presentation Layer
        MB[Mobile Banking]
        IB[Internet Banking]
    end

    subgraph Integration Layer
        APIGW[API Gateway]
        ESB[ESB]
    end

    subgraph System of Record
        CB[Core Banking]
        DWH[Data Warehouse]
    end

    %% 1. User Access Flow
    C --> MB
    C --> IB
    MB --> APIGW
    IB --> APIGW

    %% 2. Core Transaction Flow
    APIGW --> ESB
    ESB --> CB

    %% 3. Data Flow
    CB --> DWH

    %% Styling for clarity (Optional)
    classDef critical fill:#f99,stroke:#333,stroke-width:2px;
    class CB critical;
    classDef high fill:#ffc,stroke:#333,stroke-width:1px;
    class APIGW high;
    class ESB high;
```
 
### Explanation of Components:
*   **Customers:** The end-users initiating transactions.
*   **Mobile Banking / Internet Banking:** The primary user-facing touchpoints.
*   **API Gateway:** The single entry point for all external API calls, handling authentication and routing.
*   **ESB:** The Enterprise Service Bus, responsible for orchestrating and transforming messages between services.
*   **Core Banking:** The authoritative system of record for all financial transactions.
*   **Data Warehouse:** The centralized repository for aggregated data used for analytics and reporting.

This diagram models the flow from the user interface, through the integration layers, down to the core systems, and finally into the data layer.
