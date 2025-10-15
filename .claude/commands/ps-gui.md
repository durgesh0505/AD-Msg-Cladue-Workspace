Generate PowerShell script with WPF/XAML GUI using latest documentation and modern UI patterns.

## Usage

```bash
/ps-gui "[description of GUI tool and functionality]"
```

## Behavior

Generates PowerShell scripts with WPF/XAML graphical user interface:

1. **Fetch Latest Docs**: Use Context7 for WPF and XAML best practices
2. **Design XAML UI**: Create modern UI with XAML markup
3. **Implement PowerShell Logic**: Wire event handlers to backend operations
4. **Apply Theme**: Use theme file (when provided) for consistent styling
5. **Generate Complete Script**: XAML + PowerShell with error handling
6. **Save Script**: Save to `scripts/[Category]/[Tool-Name]-GUI.ps1`

## WPF/XAML Advantages

- **Modern UI**: Clean, professional appearance
- **Data Binding**: Automatic UI updates from data changes
- **MVVM Pattern**: Separation of UI and logic
- **Theming**: Centralized styling and themes
- **Rich Controls**: Advanced grids, tabs, ribbons, charts
- **XAML Markup**: Declarative UI design

## Examples

### Example 1: AD User Search Tool

**Command**:
```bash
/ps-gui "Create AD user search tool. Search by name or email, display results in DataGrid showing name, email, department, manager. Click to view full properties."
```

**Generated**: `scripts/AD/AD-User-Search-Tool-GUI.ps1`

**XAML Structure**:
```xml
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="AD User Search Tool" Height="600" Width="900"
        WindowStartupLocation="CenterScreen">
    <Grid Margin="10">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>

        <!-- Search Controls -->
        <StackPanel Grid.Row="0" Orientation="Horizontal" Margin="0,0,0,10">
            <TextBox Name="SearchBox" Width="300" Height="30"
                     VerticalContentAlignment="Center"
                     Margin="0,0,10,0"/>
            <Button Name="SearchButton" Content="Search" Width="100" Height="30"/>
            <Button Name="ClearButton" Content="Clear" Width="100" Height="30" Margin="10,0,0,0"/>
        </StackPanel>

        <!-- Results DataGrid -->
        <DataGrid Grid.Row="1" Name="ResultsGrid"
                  AutoGenerateColumns="False"
                  IsReadOnly="True"
                  SelectionMode="Single"
                  CanUserResizeColumns="True">
            <DataGrid.Columns>
                <DataGridTextColumn Header="Name" Binding="{Binding Name}" Width="*"/>
                <DataGridTextColumn Header="Email" Binding="{Binding EmailAddress}" Width="*"/>
                <DataGridTextColumn Header="Department" Binding="{Binding Department}" Width="*"/>
                <DataGridTextColumn Header="Manager" Binding="{Binding Manager}" Width="*"/>
            </DataGrid.Columns>
        </DataGrid>

        <!-- Status Bar -->
        <StatusBar Grid.Row="2" Height="25" Margin="0,10,0,0">
            <StatusBarItem>
                <TextBlock Name="StatusText" Text="Ready"/>
            </StatusBarItem>
        </StatusBar>
    </Grid>
</Window>
```

**PowerShell Code**:
```powershell
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

# Import AD module
Import-Module ActiveDirectory -ErrorAction Stop

# Load XAML
[xml]$xaml = @"
[XAML content here]
"@

# Create window
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Get controls
$searchBox = $window.FindName("SearchBox")
$searchButton = $window.FindName("SearchButton")
$clearButton = $window.FindName("ClearButton")
$resultsGrid = $window.FindName("ResultsGrid")
$statusText = $window.FindName("StatusText")

# Search button click event
$searchButton.Add_Click({
    try {
        $statusText.Text = "Searching..."
        $searchTerm = $searchBox.Text

        if ([string]::IsNullOrWhiteSpace($searchTerm)) {
            [System.Windows.MessageBox]::Show("Please enter search term", "Validation", "OK", "Warning")
            return
        }

        # Search AD
        $users = Get-ADUser -Filter "Name -like '*$searchTerm*' -or EmailAddress -like '*$searchTerm*'" `
            -Properties DisplayName, EmailAddress, Department, Manager |
            Select-Object @{N='Name';E={$_.DisplayName}},
                          EmailAddress,
                          Department,
                          @{N='Manager';E={(Get-ADUser $_.Manager -ErrorAction SilentlyContinue).Name}}

        $resultsGrid.ItemsSource = $users
        $statusText.Text = "Found $($users.Count) users"
    }
    catch {
        [System.Windows.MessageBox]::Show("Error: $_", "Search Failed", "OK", "Error")
        $statusText.Text = "Search failed"
    }
})

# Clear button click event
$clearButton.Add_Click({
    $searchBox.Clear()
    $resultsGrid.ItemsSource = $null
    $statusText.Text = "Ready"
})

# Show window
$window.ShowDialog() | Out-Null
```

---

### Example 2: Azure VM Manager

**Command**:
```bash
/ps-gui "Azure VM manager. ComboBox for subscription selection, ListBox showing VMs with status icons. Buttons: Start, Stop, Restart. Properties panel on right showing VM details."
```

**Generated**: `scripts/Azure/Azure-VM-Manager-GUI.ps1`

**Features**:
- Subscription dropdown with auto-population
- VM list with status indicators (color-coded)
- Action buttons (enabled/disabled based on VM state)
- Property panel with VM details (size, OS, IP, tags)
- Progress ring during operations
- Auto-refresh after actions

---

### Example 3: Bulk User Creator with Validation

**Command**:
```bash
/ps-gui "Bulk AD user creator. Load CSV button, DataGrid showing users with validation columns (✓ checkmark or ✗ error). Validate button, Create button (disabled until valid), ProgressBar during creation."
```

**Generated**: `scripts/AD/Bulk-User-Creator-GUI.ps1`

**XAML Features**:
- File picker dialog
- DataGrid with colored validation status cells
- Multi-step process (Load → Validate → Create)
- Progress bar with status updates
- Results summary dialog
- Error log export button

---

### Example 4: M365 License Manager

**Command**:
```bash
/ps-gui "M365 license manager. Top: user search. Middle: DataGrid with users and checkbox columns for each license type. Bottom: license availability counters. Apply Changes button."
```

**Generated**: `scripts/M365/M365-License-Manager-GUI.ps1`

**Advanced Features**:
- Custom DataGrid columns with checkboxes
- Two-way data binding for license changes
- Real-time license availability updates
- Batch license assignment
- Undo/Redo functionality
- Change summary before apply

---

## XAML UI Patterns

### Modern Layout
```xml
<Grid>
    <Grid.RowDefinitions>
        <RowDefinition Height="Auto"/>    <!-- Toolbar/Search -->
        <RowDefinition Height="*"/>       <!-- Main content -->
        <RowDefinition Height="Auto"/>    <!-- Status/Actions -->
    </Grid.RowDefinitions>
</Grid>
```

### Data Binding
```xml
<!-- Bind to PowerShell object properties -->
<TextBlock Text="{Binding DisplayName}"/>
<TextBox Text="{Binding Email, UpdateSourceTrigger=PropertyChanged}"/>
<CheckBox IsChecked="{Binding IsEnabled}"/>
```

### Command Binding
```xml
<Button Content="Save" Command="{Binding SaveCommand}"/>
```

### Styling
```xml
<Button Style="{StaticResource PrimaryButton}" Content="Search"/>
<DataGrid Style="{StaticResource ModernGrid}"/>
```

---

## Common XAML Controls

### Input Controls
- **TextBox**: Single/multi-line text input
- **PasswordBox**: Password input (masked)
- **ComboBox**: Dropdown selection
- **CheckBox**: Boolean input
- **RadioButton**: Single selection from group
- **DatePicker**: Date selection
- **Slider**: Numeric range input

### Display Controls
- **Label/TextBlock**: Static text
- **DataGrid**: Tabular data (sortable, filterable)
- **ListBox**: List of items
- **TreeView**: Hierarchical data
- **Image**: Display images
- **ProgressBar**: Progress indication
- **StatusBar**: Status information

### Layout Controls
- **Grid**: Row/column layout
- **StackPanel**: Vertical/horizontal stack
- **WrapPanel**: Auto-wrapping layout
- **DockPanel**: Docking layout
- **TabControl**: Multi-tab interface
- **GroupBox**: Grouped controls
- **Expander**: Collapsible sections

### Action Controls
- **Button**: Standard button
- **ToggleButton**: Toggle state button
- **MenuItem**: Menu items
- **ContextMenu**: Right-click menu
- **ToolBar**: Toolbar with buttons

---

## PowerShell + XAML Structure

```powershell
<#
.SYNOPSIS
    [Tool Name] WPF GUI

.DESCRIPTION
    Modern WPF interface for [functionality]

.NOTES
    Prerequisites:
    - PowerShell 5.1 or later (.NET Framework)
    - Required modules: [list]
    - Required permissions: [list]
#>

# Load assemblies
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Windows.Forms  # For dialogs

# Import modules
Import-Module ActiveDirectory -ErrorAction Stop

# XAML definition
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Tool Title" Height="600" Width="800">
    <!-- XAML content -->
</Window>
"@

# Remove x:Name attributes for XamlReader compatibility
$xaml.Window.RemoveAttribute("x:Class")

# Load XAML
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Get named controls
$controlName = $window.FindName("ControlName")

# Event handlers
$controlName.Add_Click({
    # Event logic
})

# Helper functions
function Show-ErrorDialog {
    param([string]$Message)
    [System.Windows.MessageBox]::Show($Message, "Error", "OK", "Error")
}

function Show-SuccessDialog {
    param([string]$Message)
    [System.Windows.MessageBox]::Show($Message, "Success", "OK", "Information")
}

# Show window
$null = $window.ShowDialog()
```

---

## Dark Theme Integration

**REQUIRED**: All GUI scripts MUST use the comprehensive dark theme from `docs/PowerShell-GUI-Dark-Theme-Reference.md`.

**Theme Reference**: See `docs/PowerShell-GUI-Dark-Theme-Reference.md` for:
- Complete color palette (primary background: #1E1E1E)
- All control styles (TextBox, Button, ComboBox, DataGrid, etc.)
- Professional Microsoft Fluent Design appearance
- High contrast accessibility compliance
- ReadOnly, Disabled, and Focus state styling

**Implementation Pattern**:
```powershell
# XAML with embedded dark theme styles
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Tool Title" Height="600" Width="800"
        WindowStartupLocation="CenterScreen"
        Background="#1E1E1E">
    <Window.Resources>
        <!-- ALL STYLES FROM DARK THEME REFERENCE GO HERE -->

        <!-- TextBox Style -->
        <Style TargetType="TextBox">
            <Setter Property="Background" Value="#2D2D2D"/>
            <Setter Property="Foreground" Value="#FFFFFF"/>
            <Setter Property="BorderBrush" Value="#3F3F3F"/>
            <Setter Property="CaretBrush" Value="#FFFFFF"/>
            <Setter Property="SelectionBrush" Value="#0078D4"/>
            <Setter Property="Padding" Value="5,2"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Style.Triggers>
                <Trigger Property="IsReadOnly" Value="True">
                    <Setter Property="Background" Value="#1A1A1A"/>
                    <Setter Property="Foreground" Value="#CCCCCC"/>
                </Trigger>
                <Trigger Property="IsFocused" Value="True">
                    <Setter Property="BorderBrush" Value="#0078D4"/>
                    <Setter Property="BorderThickness" Value="2"/>
                </Trigger>
            </Style.Triggers>
        </Style>

        <!-- Button Style -->
        <Style TargetType="Button">
            <Setter Property="Background" Value="#0078D4"/>
            <Setter Property="Foreground" Value="#FFFFFF"/>
            <Setter Property="BorderBrush" Value="#0078D4"/>
            <Setter Property="Padding" Value="10,5"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}"
                                BorderBrush="{TemplateBinding BorderBrush}"
                                BorderThickness="1"
                                CornerRadius="3">
                            <ContentPresenter HorizontalAlignment="Center"
                                            VerticalAlignment="Center"/>
                        </Border>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Background" Value="#106EBE"/>
                </Trigger>
                <Trigger Property="IsPressed" Value="True">
                    <Setter Property="Background" Value="#005A9E"/>
                </Trigger>
            </Style.Triggers>
        </Style>

        <!-- Include ALL other control styles from the reference guide -->
        <!-- See docs/PowerShell-GUI-Dark-Theme-Reference.md for complete styles -->
    </Window.Resources>

    <!-- Your UI content here -->
</Window>
"@
```

**Key Theme Colors**:
- **Primary Background**: #1E1E1E (main window)
- **Secondary Background**: #2D2D2D (controls)
- **Border Color**: #3F3F3F
- **Primary Text**: #FFFFFF
- **Accent Blue**: #0078D4 (buttons, selections)
- **Hover State**: #106EBE
- **ReadOnly Background**: #1A1A1A
- **Disabled Text**: #666666

**Required Styles** (copy from reference guide):
- TextBox (with ReadOnly, Disabled, Focus states)
- Button (with Hover, Pressed states)
- ComboBox (with custom dropdown styling)
- DataGrid/ListView (with selection highlighting)
- Label, CheckBox, RadioButton
- ProgressBar, StatusBar
- ToolTip (with drop shadow)
- All other controls used in the GUI

---

## Best Practices

### XAML
- ✅ Use Grid for complex layouts
- ✅ Name only controls you'll access from code
- ✅ Use data binding instead of manual updates
- ✅ Keep XAML readable with proper indentation
- ✅ Use resource dictionaries for reusable styles

### PowerShell
- ✅ Load assemblies at script start
- ✅ Use try-catch in event handlers
- ✅ Show progress for long operations
- ✅ Validate input before processing
- ✅ Use dialogs for confirmations/errors
- ✅ Dispose resources properly

### User Experience
- ✅ Responsive UI (no freezing)
- ✅ Clear feedback messages
- ✅ Confirmation for destructive actions
- ✅ Keyboard shortcuts (Alt+Key)
- ✅ Tab order for navigation
- ✅ Tooltips for complex controls
- ✅ Consistent button placement

---

## Advanced Features

### Async Operations
```powershell
# Use background jobs to prevent UI freezing
$searchButton.Add_Click({
    $statusText.Text = "Searching..."

    $runspace = [runspacefactory]::CreateRunspace()
    $runspace.Open()
    $powershell = [powershell]::Create().AddScript({
        param($searchTerm)
        Get-ADUser -Filter "Name -like '*$searchTerm*'"
    }).AddArgument($searchBox.Text)

    $powershell.Runspace = $runspace
    $handle = $powershell.BeginInvoke()

    # Poll for completion and update UI
})
```

### Custom Validation
```powershell
# Custom validation rules in XAML
<TextBox>
    <TextBox.Text>
        <Binding Path="Email">
            <Binding.ValidationRules>
                <local:EmailValidationRule/>
            </Binding.ValidationRules>
        </Binding>
    </TextBox.Text>
</TextBox>
```

### Data Templates
```xml
<!-- Custom item templates -->
<ListBox ItemsSource="{Binding Users}">
    <ListBox.ItemTemplate>
        <DataTemplate>
            <StackPanel Orientation="Horizontal">
                <Image Source="{Binding Avatar}" Width="32" Height="32"/>
                <TextBlock Text="{Binding Name}" Margin="10,0,0,0"/>
            </StackPanel>
        </DataTemplate>
    </ListBox.ItemTemplate>
</ListBox>
```

---

## Integration

- **Context7 MCP**: Latest WPF and XAML best practices
- **PowerShell Builder Agent**: Automatically activated
- **Theme File**: Will be applied when provided

---

## Related Commands

- `/ps-script` - Generate command-line PowerShell script
- `/ps-graph` - Microsoft Graph operations
- `@powershell-builder` - PowerShell expert agent

---

## Tips

1. **Use XAML Designer**: Visual Studio or VS Code with XAML extension for design
2. **Test XAML First**: Validate XAML loads before adding complex logic
3. **Data Binding**: Prefer binding over manual UI updates
4. **Keep Event Handlers Simple**: Complex logic in separate functions
5. **Use ObservableCollection**: For dynamic data that updates UI automatically
6. **Handle Exceptions**: Wrap event handlers in try-catch
7. **Theme Consistency**: Wait for theme file to ensure consistent styling
