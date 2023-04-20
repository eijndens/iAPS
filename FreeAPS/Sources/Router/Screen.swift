import SwiftUI
import Swinject

enum Screen: Identifiable, Hashable {
    case loading
    case home
    case settings
    case configEditor(file: String)
    case nighscoutConfig
    case libreViewConfig
    case pumpConfig
    case pumpSettingsEditor
    case basalProfileEditor
    case isfEditor
    case crEditor
    case targetsEditor
    case preferencesEditor
    case addCarbs
    case addTempTarget
    case bolus(waitForSuggestion: Bool)
    case manualTempBasal
    case autotuneConfig
    case dataTable
    case cgm
    case healthkit
    case libreConfig
    case calibrations
    case notificationsConfig
    case fpuConfig
    case iconConfig
    case overrideProfilesConfig
    case snooze
    case statistics

    var id: Int { String(reflecting: self).hashValue }
}

extension Screen {
    @ViewBuilder func view(resolver: Resolver) -> some View {
        switch self {
        case .loading:
            ProgressView()
        case .home:
            Home.RootView(
                resolver: resolver,
                selectedState: .day
            )
        case .settings:
            Settings.RootView(resolver: resolver)
        case let .configEditor(file):
            ConfigEditor.RootView(resolver: resolver, file: file)
        case .nighscoutConfig:
            NightscoutConfig.RootView(resolver: resolver)
        case .libreViewConfig:
            LibreViewConfig.RootView(resolver: resolver)
        case .pumpConfig:
            PumpConfig.RootView(resolver: resolver)
        case .pumpSettingsEditor:
            PumpSettingsEditor.RootView(resolver: resolver)
        case .basalProfileEditor:
            BasalProfileEditor.RootView(resolver: resolver)
        case .isfEditor:
            ISFEditor.RootView(resolver: resolver)
        case .crEditor:
            CREditor.RootView(resolver: resolver)
        case .targetsEditor:
            TargetsEditor.RootView(resolver: resolver)
        case .preferencesEditor:
            PreferencesEditor.RootView(resolver: resolver)
        case .addCarbs:
            AddCarbs.RootView(resolver: resolver)
        case .addTempTarget:
            AddTempTarget.RootView(resolver: resolver)
        case let .bolus(waitForSuggestion):
            Bolus.RootView(resolver: resolver, waitForSuggestion: waitForSuggestion)
        case .manualTempBasal:
            ManualTempBasal.RootView(resolver: resolver)
        case .autotuneConfig:
            AutotuneConfig.RootView(resolver: resolver)
        case .dataTable:
            DataTable.RootView(resolver: resolver)
        case .cgm:
            CGM.RootView(resolver: resolver)
        case .healthkit:
            AppleHealthKit.RootView(resolver: resolver)
        case .libreConfig:
            LibreConfig.RootView(resolver: resolver)
        case .calibrations:
            Calibrations.RootView(resolver: resolver)
        case .notificationsConfig:
            NotificationsConfig.RootView(resolver: resolver)
        case .fpuConfig:
            FPUConfig.RootView(resolver: resolver)
        case .iconConfig:
            IconConfig.RootView(resolver: resolver)
        case .overrideProfilesConfig:
            OverrideProfilesConfig.RootView(resolver: resolver)
        case .snooze:
            Snooze.RootView(resolver: resolver)
        case .statistics:
            Statistics_.RootView(resolver: resolver)
        }
    }

    func modal(resolver: Resolver) -> Main.Modal {
        .init(screen: self, view: view(resolver: resolver).asAny())
    }
}
