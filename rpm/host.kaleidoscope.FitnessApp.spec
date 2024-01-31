Name:       host.kaleidoscope.FitnessApp

Summary:    Fitness - ваш персональный тренер и гид в мире здоровья.
Version:    0.2.4
Release:    8
Group:      Qt/Qt
License:    BSD-3-Clause
URL:        https://git.failover.bar/hackathon/aurora-15-12-2023/im
Source0:    %{name}-%{version}.tar.bz2

Requires:   sailfishsilica-qt5 >= 0.10.9
BuildRequires:  pkgconfig(auroraapp)
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  desktop-file-utils

%changelog
* 2024-01-31 Разработчик kalashnikovjan@yandex.ru - 0.2.4-8
Изменения и исправления:
- Добавлен Splash экран приложения
- Обновлена иконка приложения


%description
Fitness - ваш персональный тренер и гид в мире здоровья! Получайте персонализированные программы тренировок и питания, отслеживайте свой прогресс, контролируйте активность и достигайте своих фитнес-целей. С интуитивным интерфейсом, мотивирующими уведомлениями и возможностью поддержки от сообщества, Fitness делает заботу о своем здоровье простой и увлекательной.

%prep
%setup -q -n %{name}-%{version}

%build
%qmake5
%make_build

%install
rm -rf %{buildroot}
%qmake5_install

desktop-file-install --delete-original         --dir %{buildroot}%{_datadir}/applications                %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%{_bindir}
%defattr(644,root,root,-)
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
