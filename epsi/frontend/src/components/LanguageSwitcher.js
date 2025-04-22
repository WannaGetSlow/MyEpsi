import React, { useState, useRef, useEffect } from 'react';
import { useTranslation } from 'react-i18next';

const LanguageSwitcher = () => {
    const { i18n } = useTranslation();
    const [isOpen, setIsOpen] = useState(false);
    const dropdownRef = useRef(null);

    const languages = [
        { code: 'en', name: 'English', flag: '🇬🇧' },
        { code: 'fr', name: 'Français', flag: '🇫🇷' },
        { code: 'es', name: 'Español', flag: '🇪🇸' },
        { code: 'de', name: 'Deutsch', flag: '🇩🇪' }
    ];

    const changeLanguage = (lng) => {
        i18n.changeLanguage(lng);
        localStorage.setItem('language', lng);
        setIsOpen(false);
    };

    useEffect(() => {
        const handleClickOutside = (event) => {
            if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
                setIsOpen(false);
            }
        };

        document.addEventListener('mousedown', handleClickOutside);
        return () => document.removeEventListener('mousedown', handleClickOutside);
    }, []);

    const currentLanguage = languages.find(lang => lang.code === i18n.language) || languages[0];

    return (
        <div className="language-switcher" ref={dropdownRef}>
            <button 
                className="language-button"
                onClick={() => setIsOpen(!isOpen)}
            >
                <span role="img" aria-label={`${currentLanguage.name} flag`}>
                    {currentLanguage.flag}
                </span>
                <span className="lang-text">{currentLanguage.name}</span>
                <span className="arrow">{isOpen ? '▲' : '▼'}</span>
            </button>
            
            {isOpen && (
                <div className="language-dropdown">
                    {languages.map((lang) => (
                        <button
                            key={lang.code}
                            onClick={() => changeLanguage(lang.code)}
                            className={`dropdown-item ${i18n.language === lang.code ? 'active' : ''}`}
                        >
                            <span role="img" aria-label={`${lang.name} flag`}>
                                {lang.flag}
                            </span>
                            <span className="lang-text">{lang.name}</span>
                        </button>
                    ))}
                </div>
            )}
        </div>
    );
};

export default LanguageSwitcher;