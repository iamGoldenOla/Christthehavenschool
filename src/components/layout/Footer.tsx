import { Link } from "react-router-dom";
import { MapPin, Phone, Mail, Facebook, Twitter, Instagram, Youtube } from "lucide-react";

const Footer = () => {
  return (
    <footer className="bg-primary text-primary-foreground">
      {/* Main Footer */}
      <div className="container-custom section-padding">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12">
          {/* School Info */}
          <div>
            <div className="flex items-center gap-3 mb-6">
              <div className="w-12 h-12 rounded-full bg-secondary flex items-center justify-center">
                <span className="font-serif text-secondary-foreground font-bold text-lg">CTH</span>
              </div>
              <div>
                <h3 className="font-serif font-bold text-lg">Christ The Haven</h3>
                <p className="text-sm opacity-80">School</p>
              </div>
            </div>
            <p className="text-sm opacity-80 leading-relaxed mb-6">
              Nurturing excellence, building character, and preparing students for a bright future 
              through quality education and holistic development.
            </p>
            <div className="flex gap-3">
              <a href="#" className="w-10 h-10 rounded-full bg-primary-foreground/10 flex items-center justify-center hover:bg-secondary hover:text-secondary-foreground transition-colors">
                <Facebook size={18} />
              </a>
              <a href="#" className="w-10 h-10 rounded-full bg-primary-foreground/10 flex items-center justify-center hover:bg-secondary hover:text-secondary-foreground transition-colors">
                <Twitter size={18} />
              </a>
              <a href="#" className="w-10 h-10 rounded-full bg-primary-foreground/10 flex items-center justify-center hover:bg-secondary hover:text-secondary-foreground transition-colors">
                <Instagram size={18} />
              </a>
              <a href="#" className="w-10 h-10 rounded-full bg-primary-foreground/10 flex items-center justify-center hover:bg-secondary hover:text-secondary-foreground transition-colors">
                <Youtube size={18} />
              </a>
            </div>
          </div>

          {/* Quick Links */}
          <div>
            <h4 className="font-serif font-bold text-lg mb-6">Quick Links</h4>
            <ul className="space-y-3">
              {["About Us", "Academics", "Admissions", "Events", "News & Blog", "Contact"].map((link) => (
                <li key={link}>
                  <Link to="#" className="text-sm opacity-80 hover:opacity-100 hover:text-secondary transition-all">
                    {link}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Academic Programs */}
          <div>
            <h4 className="font-serif font-bold text-lg mb-6">Programs</h4>
            <ul className="space-y-3">
              {["Early Years", "Primary School", "Middle School", "High School", "Extra-Curricular", "STEM Programs"].map((program) => (
                <li key={program}>
                  <Link to="#" className="text-sm opacity-80 hover:opacity-100 hover:text-secondary transition-all">
                    {program}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Contact Info */}
          <div>
            <h4 className="font-serif font-bold text-lg mb-6">Contact Us</h4>
            <ul className="space-y-4">
              <li className="flex items-start gap-3">
                <MapPin size={18} className="mt-1 text-secondary" />
                <span className="text-sm opacity-80">
                  123 Education Avenue,<br />
                  Knowledge City, KC 12345
                </span>
              </li>
              <li className="flex items-center gap-3">
                <Phone size={18} className="text-secondary" />
                <span className="text-sm opacity-80">+1 (234) 567-8900</span>
              </li>
              <li className="flex items-center gap-3">
                <Mail size={18} className="text-secondary" />
                <span className="text-sm opacity-80">info@christthehaven.edu</span>
              </li>
            </ul>
          </div>
        </div>
      </div>

      {/* Bottom Bar */}
      <div className="border-t border-primary-foreground/10">
        <div className="container-custom py-6 flex flex-col md:flex-row items-center justify-between gap-4">
          <p className="text-sm opacity-60">
            © 2024 Christ The Haven School. All rights reserved.
          </p>
          <div className="flex gap-6">
            <Link to="#" className="text-sm opacity-60 hover:opacity-100 transition-opacity">
              Privacy Policy
            </Link>
            <Link to="#" className="text-sm opacity-60 hover:opacity-100 transition-opacity">
              Terms of Service
            </Link>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
