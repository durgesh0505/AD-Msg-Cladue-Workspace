# PowerShell GUI Dark Theme Reference

**Version**: 2025.1  
**Author**: Enterprise PowerShell Development Team  
**Purpose**: Comprehensive dark theme implementation for PowerShell WPF applications

## Overview

This document provides a complete dark theme implementation for PowerShell WPF (Windows Presentation Foundation) GUI applications. The theme is designed for enterprise environments with focus on:

- **Professional appearance** with Microsoft's design language
- **Eye strain reduction** for extended use
- **High contrast accessibility** compliance
- **Consistent user experience** across applications

## Color Palette

### Primary Colors
```xml
<!-- Background Colors -->
<Color x:Key="PrimaryBackground">#1E1E1E</Color>      <!-- Main window background -->
<Color x:Key="SecondaryBackground">#2D2D2D</Color>    <!-- Control backgrounds -->
<Color x:Key="ReadOnlyBackground">#1A1A1A</Color>     <!-- ReadOnly controls -->
<Color x:Key="BorderColor">#3F3F3F</Color>            <!-- Borders and separators -->

<!-- Text Colors -->
<Color x:Key="PrimaryText">#FFFFFF</Color>            <!-- Main text -->
<Color x:Key="SecondaryText">#CCCCCC</Color>          <!-- ReadOnly text -->
<Color x:Key="DisabledText">#666666</Color>           <!-- Disabled text -->
<Color x:Key="CaretColor">#FFFFFF</Color>             <!-- Text cursor -->

<!-- Accent Colors -->
<Color x:Key="AccentBlue">#0078D4</Color>             <!-- Primary buttons, selections -->
<Color x:Key="AccentBlueHover">#106EBE</Color>        <!-- Hover states -->
<Color x:Key="AccentBluePressed">#005A9E</Color>      <!-- Pressed states -->

<!-- Status Colors -->
<Color x:Key="HoverBackground">#3E3E42</Color>        <!-- Mouse over background -->
<Color x:Key="DisabledBackground">#666666</Color>     <!-- Disabled controls -->
<Color x:Key="ErrorColor">#FF5F56</Color>             <!-- Error states -->
<Color x:Key="WarningColor">#FFBD2E</Color>           <!-- Warning states -->
<Color x:Key="SuccessColor">#28CA42</Color>           <!-- Success states -->
```

## Core Control Styles

### Window Style
```xml
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Background="#1E1E1E">
    <Window.Resources>
        <!-- All styles go here -->
    </Window.Resources>
</Window>
```

### TextBox Style
```xml
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
            <Setter Property="BorderBrush" Value="#2D2D2D"/>
        </Trigger>
        <Trigger Property="IsEnabled" Value="False">
            <Setter Property="Background" Value="#1A1A1A"/>
            <Setter Property="Foreground" Value="#666666"/>
            <Setter Property="BorderBrush" Value="#2D2D2D"/>
        </Trigger>
        <Trigger Property="IsFocused" Value="True">
            <Setter Property="BorderBrush" Value="#0078D4"/>
            <Setter Property="BorderThickness" Value="2"/>
        </Trigger>
    </Style.Triggers>
</Style>
```

### Button Style
```xml
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
        <Trigger Property="IsEnabled" Value="False">
            <Setter Property="Background" Value="#666666"/>
            <Setter Property="BorderBrush" Value="#666666"/>
        </Trigger>
    </Style.Triggers>
</Style>
```

### ComboBox Style (Advanced)
```xml
<!-- ComboBox Toggle Button Template -->
<ControlTemplate x:Key="ComboBoxToggleButton" TargetType="ToggleButton">
    <Border BorderThickness="1" BorderBrush="#3F3F3F" Background="#2D2D2D">
        <Border.Effect>
            <DropShadowEffect Color="Black" Direction="320" ShadowDepth="3" 
                            BlurRadius="5" Opacity="0.35"/>
        </Border.Effect>
        <Grid>
            <Grid.ColumnDefinitions>
                <ColumnDefinition />
                <ColumnDefinition Width="32" />
            </Grid.ColumnDefinitions>
            <Border Grid.Column="1" Background="Transparent">
                <Path x:Name="Arrow"
                      Fill="#FFFFFF"
                      HorizontalAlignment="Center"
                      VerticalAlignment="Center"
                      Data="M 0 0 L 8 8 L 16 0 Z"/>
            </Border>
        </Grid>
    </Border>
</ControlTemplate>

<!-- ComboBox Main Style -->
<Style TargetType="ComboBox">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="ComboBox">
                <Grid>
                    <ToggleButton 
                        Name="ToggleButton" 
                        BorderBrush="{TemplateBinding BorderBrush}"
                        Background="{TemplateBinding Background}"
                        Foreground="{TemplateBinding Foreground}"
                        IsChecked="{Binding Path=IsDropDownOpen,Mode=TwoWay,RelativeSource={RelativeSource TemplatedParent}}"
                        Template="{StaticResource ComboBoxToggleButton}"/>
                    <ContentPresenter
                        Name="ContentSite"
                        IsHitTestVisible="False" 
                        Content="{TemplateBinding SelectionBoxItem}"
                        ContentTemplate="{TemplateBinding SelectionBoxItemTemplate}"
                        ContentTemplateSelector="{TemplateBinding ItemTemplateSelector}"
                        Margin="8,3,32,3"
                        VerticalAlignment="Center"
                        HorizontalAlignment="Left" />
                    <Popup 
                        Name="Popup"
                        Placement="Bottom"
                        IsOpen="{TemplateBinding IsDropDownOpen}"
                        AllowsTransparency="True" 
                        Focusable="False"
                        PopupAnimation="Slide">
                        <Grid 
                            Name="DropDown"
                            SnapsToDevicePixels="True"
                            MinWidth="{TemplateBinding ActualWidth}"
                            MaxHeight="{TemplateBinding MaxDropDownHeight}">
                            <Border 
                                x:Name="DropDownBorder"
                                Background="#2D2D2D"
                                BorderThickness="1"
                                BorderBrush="#3F3F3F"/>
                            <ScrollViewer Margin="4,6,4,6" SnapsToDevicePixels="True">
                                <StackPanel IsItemsHost="True" 
                                          KeyboardNavigation.DirectionalNavigation="Contained" />
                            </ScrollViewer>
                        </Grid>
                    </Popup>
                </Grid>
            </ControlTemplate>
        </Setter.Value>
    </Setter>
</Style>

<!-- ComboBox Item Style -->
<Style TargetType="ComboBoxItem">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="Padding" Value="4,2"/>
    <Style.Triggers>
        <Trigger Property="IsMouseOver" Value="True">
            <Setter Property="Background" Value="#0078D4"/>
        </Trigger>
        <Trigger Property="IsSelected" Value="True">
            <Setter Property="Background" Value="#0078D4"/>
            <Setter Property="Foreground" Value="#FFFFFF"/>
        </Trigger>
    </Style.Triggers>
</Style>
```

### ListBox Style
```xml
<Style TargetType="ListBox">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="SelectionMode" Value="Extended"/>
</Style>
```

### ListView with GridView Style
```xml
<Style TargetType="ListView">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
</Style>

<Style TargetType="ListViewItem">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="HorizontalContentAlignment" Value="Stretch"/>
    <Style.Triggers>
        <Trigger Property="IsSelected" Value="True">
            <Setter Property="Background" Value="#0078D4"/>
            <Setter Property="Foreground" Value="#FFFFFF"/>
            <Setter Property="FontWeight" Value="Bold"/>
        </Trigger>
        <Trigger Property="IsMouseOver" Value="True">
            <Setter Property="Background" Value="#3E3E42"/>
            <Setter Property="Cursor" Value="Hand"/>
        </Trigger>
    </Style.Triggers>
</Style>

<Style TargetType="GridViewColumnHeader">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="Padding" Value="5"/>
</Style>
```

### TabControl Style
```xml
<Style TargetType="TabControl">
    <Setter Property="Background" Value="#1E1E1E"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
</Style>

<Style TargetType="TabItem">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="TabItem">
                <Border Name="Border" BorderThickness="1,1,1,0" 
                        BorderBrush="#3F3F3F" CornerRadius="2,2,0,0" Margin="2,0">
                    <ContentPresenter x:Name="ContentSite" 
                                    VerticalAlignment="Center" 
                                    HorizontalAlignment="Center" 
                                    ContentSource="Header" Margin="10,5"/>
                </Border>
                <ControlTemplate.Triggers>
                    <Trigger Property="IsSelected" Value="True">
                        <Setter TargetName="Border" Property="Background" Value="#0078D4"/>
                        <Setter Property="Foreground" Value="White"/>
                    </Trigger>
                    <Trigger Property="IsSelected" Value="False">
                        <Setter TargetName="Border" Property="Background" Value="#2D2D2D"/>
                        <Setter Property="Foreground" Value="White"/>
                    </Trigger>
                    <Trigger Property="IsMouseOver" Value="True">
                        <Setter TargetName="Border" Property="Background" Value="#106EBE"/>
                    </Trigger>
                </ControlTemplate.Triggers>
            </ControlTemplate>
        </Setter.Value>
    </Setter>
</Style>
```

### TreeView Style
```xml
<Style TargetType="TreeView">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
</Style>

<Style TargetType="TreeViewItem">
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Style.Triggers>
        <Trigger Property="IsSelected" Value="True">
            <Setter Property="Background" Value="#0078D4"/>
            <Setter Property="Foreground" Value="#FFFFFF"/>
        </Trigger>
        <Trigger Property="IsMouseOver" Value="True">
            <Setter Property="Background" Value="#3E3E42"/>
        </Trigger>
    </Style.Triggers>
</Style>
```

### CheckBox Style
```xml
<Style TargetType="CheckBox">
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
</Style>
```

### ProgressBar Style
```xml
<Style TargetType="ProgressBar">
    <Setter Property="Background" Value="Transparent"/>
    <Setter Property="Foreground" Value="#0078D4"/>
    <Setter Property="BorderBrush" Value="Transparent"/>
    <Setter Property="Height" Value="4"/>
</Style>
```

### PasswordBox Style
```xml
<Style TargetType="PasswordBox">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="CaretBrush" Value="#FFFFFF"/>
    <Setter Property="SelectionBrush" Value="#0078D4"/>
    <Setter Property="Padding" Value="5,2"/>
    <Setter Property="BorderThickness" Value="1"/>
    <Style.Triggers>
        <Trigger Property="IsEnabled" Value="False">
            <Setter Property="Background" Value="#1A1A1A"/>
            <Setter Property="Foreground" Value="#666666"/>
            <Setter Property="BorderBrush" Value="#2D2D2D"/>
        </Trigger>
        <Trigger Property="IsFocused" Value="True">
            <Setter Property="BorderBrush" Value="#0078D4"/>
            <Setter Property="BorderThickness" Value="2"/>
        </Trigger>
    </Style.Triggers>
</Style>
```

### RadioButton Style
```xml
<Style TargetType="RadioButton">
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="Padding" Value="4,1"/>
    <Style.Triggers>
        <Trigger Property="IsEnabled" Value="False">
            <Setter Property="Foreground" Value="#666666"/>
        </Trigger>
        <Trigger Property="IsMouseOver" Value="True">
            <Setter Property="Background" Value="#3E3E42"/>
        </Trigger>
    </Style.Triggers>
</Style>
```

### GroupBox Style
```xml
<Style TargetType="GroupBox">
    <Setter Property="Background" Value="#1E1E1E"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="BorderThickness" Value="1"/>
    <Setter Property="Margin" Value="5"/>
    <Setter Property="Padding" Value="5"/>
</Style>
```

### Label Style
```xml
<Style TargetType="Label">
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="Background" Value="Transparent"/>
    <Setter Property="Padding" Value="5,2"/>
</Style>
```

### ScrollViewer Style
```xml
<Style TargetType="ScrollViewer">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
</Style>

<!-- ScrollBar Styles -->
<Style TargetType="ScrollBar">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="Foreground" Value="#666666"/>
    <Setter Property="Width" Value="18"/>
    <Style.Triggers>
        <Trigger Property="Orientation" Value="Horizontal">
            <Setter Property="Height" Value="18"/>
            <Setter Property="Width" Value="Auto"/>
        </Trigger>
    </Style.Triggers>
</Style>
```

### MenuItem Style
```xml
<Style TargetType="MenuItem">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="Padding" Value="8,4"/>
    <Style.Triggers>
        <Trigger Property="IsHighlighted" Value="True">
            <Setter Property="Background" Value="#0078D4"/>
            <Setter Property="Foreground" Value="#FFFFFF"/>
        </Trigger>
        <Trigger Property="IsEnabled" Value="False">
            <Setter Property="Foreground" Value="#666666"/>
        </Trigger>
    </Style.Triggers>
</Style>

<Style TargetType="Menu">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
</Style>

<Style TargetType="ContextMenu">
    <Setter Property="Background" Value="#2D2D2D"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="BorderThickness" Value="1"/>
</Style>
```

### ToolTip Style
```xml
<Style TargetType="ToolTip">
    <Setter Property="Background" Value="#1A1A1A"/>
    <Setter Property="Foreground" Value="#FFFFFF"/>
    <Setter Property="BorderBrush" Value="#3F3F3F"/>
    <Setter Property="BorderThickness" Value="1"/>
    <Setter Property="Padding" Value="8,4"/>
    <Setter Property="FontSize" Value="12"/>
    <Setter Property="Effect">
        <Setter.Value>
            <DropShadowEffect Color="Black" Direction="315" ShadowDepth="2" 
                            BlurRadius="4" Opacity="0.5"/>
        </Setter.Value>
    </Setter>
</Style>
```

### TextBlock Style
```xml
<Style TargetType="TextBlock">
    <Setter Property="Foreground" Value="#FFFFFF"/>
</Style>
```

## Specialized Window Templates

### User Selection Dialog
```xml
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="Select User" Height="400" Width="800"
    WindowStartupLocation="CenterOwner"
    Background="#1E1E1E">
    <!-- Apply all styles from above in Window.Resources -->
</Window>
```

### Group Search Dialog
```xml
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="Search Groups" Height="500" Width="700"
    WindowStartupLocation="CenterOwner"
    ResizeMode="CanResizeWithGrip"
    Background="#1E1E1E">
    <!-- Apply all styles from above in Window.Resources -->
</Window>
```

## Implementation Guidelines

### PowerShell Integration
```powershell
# Add required assemblies
Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase
Add-Type -AssemblyName System.Windows.Forms

# Create XAML with dark theme
[xml]$xamlCode = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Background="#1E1E1E">
    <Window.Resources>
        <!-- Insert all styles here -->
    </Window.Resources>
    <!-- Your UI content here -->
</Window>
"@

# Create window
$reader = New-Object System.Xml.XmlNodeReader $xamlCode
$window = [Windows.Markup.XamlReader]::Load($reader)

# Show window
$window.ShowDialog()
```

### Window Properties
```xml
<!-- Standard window configuration -->
<Window
    Title="Your Application Title"
    Height="600" Width="800"
    ResizeMode="CanResizeWithGrip"      <!-- or "CanMinimize" for fixed size -->
    WindowStartupLocation="CenterScreen"
    ShowInTaskbar="True"
    Background="#1E1E1E">
```

### Control Layout Best Practices
```xml
<!-- Use proper margins and padding -->
<Grid Margin="10">
    <Grid.RowDefinitions>
        <RowDefinition Height="Auto"/>  <!-- Fixed height rows for headers -->
        <RowDefinition Height="*"/>     <!-- Flexible rows for content -->
    </Grid.RowDefinitions>
    
    <!-- Consistent spacing -->
    <StackPanel Margin="0,0,0,10">
        <TextBlock Text="Label:" FontWeight="Bold" Margin="0,0,0,5"/>
        <TextBox Height="25" Padding="5,0"/>
    </StackPanel>
</Grid>
```

## Advanced Features

### Drop Shadow Effects
```xml
<Border.Effect>
    <DropShadowEffect Color="Black" Direction="320" ShadowDepth="3" 
                      BlurRadius="5" Opacity="0.35"/>
</Border.Effect>
```

### Animation Support
```xml
<!-- Add smooth transitions -->
<Style TargetType="Button">
    <Style.Triggers>
        <Trigger Property="IsMouseOver" Value="True">
            <Setter Property="Background" Value="#106EBE"/>
            <!-- Add transition animation here if needed -->
        </Trigger>
    </Style.Triggers>
</Style>
```

## Error Handling Integration

### PowerShell Error Display
```powershell
function Show-ErrorMessage {
    param($Message)
    [System.Windows.MessageBox]::Show(
        $Message, 
        "Error", 
        [System.Windows.MessageBoxButton]::OK, 
        [System.Windows.MessageBoxImage]::Error
    )
}
```

### Status Feedback
```xml
<!-- Loading indicator -->
<ProgressBar x:Name="LoadingProgressBar" 
             Height="4" 
             Width="100" 
             IsIndeterminate="True" 
             Visibility="Collapsed" 
             Background="Transparent" 
             Foreground="#0078D4" 
             BorderBrush="Transparent"/>

<!-- Status text -->
<TextBlock x:Name="StatusText" 
           Text="" 
           Foreground="#FFFFFF" 
           HorizontalAlignment="Right"/>
```

## Accessibility Features

### High Contrast Support
- All text maintains minimum 4.5:1 contrast ratio
- Focus indicators are clearly visible
- Keyboard navigation is fully supported

### Color-Blind Friendly
- Primary reliance on Microsoft's accessible blue (#0078D4)
- Shape and position cues supplement color information
- No red/green only status indicators

## Performance Considerations

### Resource Management
```powershell
# Proper cleanup
$window.Add_Closing({
    param($sender, $e)
    try {
        # Clear cached data
        $sync.CachedData.Clear()
        # Release resources
        $sync.Clear()
        [System.GC]::Collect()
    }
    catch {
        Write-Warning "Error during cleanup: $_"
    }
})
```

### Memory Optimization
- Use synchronized hashtables for thread-safe operations
- Clear cached data on window close
- Dispose of resources properly

## Testing Checklist

### Visual Testing
- [ ] All controls display correctly in dark theme
- [ ] Text is readable with sufficient contrast
- [ ] Hover states work properly
- [ ] Selection states are visible
- [ ] Focus indicators are clear

### Functionality Testing
- [ ] All interactive elements work
- [ ] Keyboard navigation functions
- [ ] Screen reader compatibility
- [ ] Window resizing works properly
- [ ] Modal dialogs display correctly

### Cross-Version Testing
- [ ] PowerShell 5.1 compatibility
- [ ] PowerShell 7.x compatibility
- [ ] Windows 10/11 compatibility
- [ ] Different DPI settings

## Key Improvements in This Version

### Visual State Improvements
- **ReadOnly TextBox styling**: Distinct appearance (#1A1A1A background, #CCCCCC text) for read-only fields
- **Focus indicators**: Blue border (#0078D4) with increased thickness for focused controls
- **Enhanced disabled states**: Consistent #666666 text color for disabled controls
- **Professional tooltips**: Dark themed with drop shadow effects

### Missing Control Support
- **PasswordBox**: Full dark theme support with focus states
- **RadioButton**: Dark theme with hover effects
- **GroupBox**: Consistent dark borders and backgrounds
- **Label**: Proper dark theme text styling
- **ScrollViewer/ScrollBar**: Dark themed scrollbars
- **MenuItem/Menu/ContextMenu**: Complete menu system dark theme support
- **ToolTip**: Professional dark tooltips with shadows

### Accessibility Enhancements
- **Text selection**: Proper SelectionBrush (#0078D4) for all text controls
- **State feedback**: Clear visual distinction between normal, readonly, disabled, and focused states
- **High contrast**: Maintained 4.5:1 contrast ratios throughout

## Common Issues & Solutions

### Issue: Controls not showing dark theme
**Solution**: Ensure all styles are defined in Window.Resources before the UI elements

### Issue: ComboBox dropdown is light
**Solution**: Use the complete ComboBox template with custom DropDownBorder

### Issue: ListView selection not visible
**Solution**: Implement ListViewItem style with proper selection triggers

### Issue: Text not readable
**Solution**: Verify contrast ratios and use #FFFFFF for text on dark backgrounds

### Issue: ReadOnly fields look the same as editable ones
**Solution**: Use the updated TextBox style with IsReadOnly trigger (#1A1A1A background)

### Issue: Focus indicators not visible
**Solution**: Ensure IsFocused triggers are implemented with blue border highlighting

### Issue: Tooltips appear in light theme
**Solution**: Include the ToolTip style in your Window.Resources

## Version History

- **2025.2**: Enhanced dark theme with comprehensive control support
  - Added ReadOnly and Disabled state styling for TextBox controls
  - Added complete control coverage: PasswordBox, RadioButton, GroupBox, Label, ScrollViewer, MenuItem, ToolTip
  - Enhanced focus indicators and accessibility features
  - Improved visual feedback for all control states
  - Fixed text selection highlighting across all text controls

- **2025.1**: Initial comprehensive dark theme implementation
  - Based on Microsoft Fluent Design principles
  - Extracted from production Active Directory management tools
  - Enterprise-tested for accessibility and usability

## Related Files

This theme is implemented in:
- `AD_User_Management.ps1` - User management interface
- `AD_Group_Management.ps1` - Group management interface

## Support

For questions or issues with this dark theme implementation:
1. Check the common issues section above
2. Verify all required assemblies are loaded
3. Test with a minimal XAML implementation first
4. Ensure PowerShell execution policy allows the script to run

---

**Note**: This theme follows Microsoft's accessibility guidelines and provides a professional, modern interface suitable for enterprise Active Directory management applications.